defmodule RemotePointsWeb.UserView do
  use RemotePointsWeb, :view
  alias RemotePointsWeb.UserView

  def render("show.json", %{users: users, time: time}) do
    %{
      users: render_many(users, UserView, "user.json"),
      timestamp: DateTime.to_iso8601(time)
    }
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, points: user.points}
  end
end
