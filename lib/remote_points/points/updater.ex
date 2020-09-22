defmodule RemotePoints.Points.Updater do
  alias RemotePoints.Points
  use GenServer

  @mill_min 60 * 1_000

  def start_link(_empty) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc """
  Return a tuple with max 2 users and the timestamps of the previous query.
  """
  def get_max_2_users() do
    GenServer.call(__MODULE__, :get_users, 5_000)
  end

  @impl GenServer
  def init(_empty) do
    max_number = generate_random_0_100()
    Process.send_after(self(), :update, @mill_min)
    {:ok, time} = DateTime.now("Etc/UTC")
    {:ok, %{max_number: max_number, last_call: time}}
  end

  @impl GenServer
  def handle_info(:update, state) do
    Points.list_users()
    |> Enum.map(&Points.update_user(&1, %{points: generate_random_0_100()}))

    Process.send_after(self(), :update, @mill_min)
    {:noreply, %{state | max_number: generate_random_0_100()}}
  end

  @impl GenServer
  def handle_call(:get_users, _from, %{max_number: max_number, last_call: timestamp} = state) do
    {:ok, time} = DateTime.now("Etc/UTC")

    {:reply, {Points.get_max_2_users_with_max_points(max_number), timestamp},
     %{state | last_call: time}}
  end

  def generate_random_0_100() do
    :rand.uniform(101) - 1
  end
end
