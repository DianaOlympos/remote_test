defmodule RemotePointsWeb.UserView do
  use RemotePointsWeb, :view
  alias RemotePointsWeb.UserView
  alias RemotePointsWeb.TimeView

  def render("show.json", %{users: users, time: time}) do
    %{
      users: render_many(users, UserView, "user.json"),
      timestamp: render_one(time, TimeView, "iso8601.json")
    }
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, points: user.points}
  end
end
