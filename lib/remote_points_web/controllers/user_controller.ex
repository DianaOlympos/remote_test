defmodule RemotePointsWeb.UserController do
  use RemotePointsWeb, :controller

  alias RemotePoints.Points.Updater

  action_fallback RemotePointsWeb.FallbackController

  # def show(conn, _params) do
  #   users = Updater.get_max_2_users()
  #   render(conn, "show.json", users: users)
  # end
end
