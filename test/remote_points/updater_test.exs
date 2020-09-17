defmodule RemotePoints.UpdaterTest do
  use RemotePoints.DataCase

  alias RemotePoints.Points
  alias RemotePoints.Points.Updater

  describe "update" do
    alias RemotePoints.Points.User

    @valid_attrs %{points: 42}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Points.create_user()

      user
    end
  end

  test "Get max 2 users" do
    users = Enum.map(1..3, fn _x -> user_fixture() end)
    {users, timestamp} = Updater.get_max_2_users()

    assert length(users) <= 2

    {:ok, time_now} = DateTime.now("Etc/UTC")
    assert DateTime.compare(time_now, timestamp) == :gt
  end
end
