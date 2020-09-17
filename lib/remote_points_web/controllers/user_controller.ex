defmodule RemotePointsWeb.UserController do
  use RemotePointsWeb, :controller

  alias RemotePoints.Points
  alias RemotePoints.Points.User

  action_fallback RemotePointsWeb.FallbackController

  # def show(conn, _params) do
  #   render(conn, "show.json", user: user)
  # end
end
