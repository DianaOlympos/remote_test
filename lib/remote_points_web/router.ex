defmodule RemotePointsWeb.Router do
  use RemotePointsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RemotePointsWeb do
    pipe_through :api
  end
end
