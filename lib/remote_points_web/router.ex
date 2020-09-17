defmodule RemotePointsWeb.Router do
  use RemotePointsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RemotePointsWeb do
    pipe_through :api

    get "/", UserController, :show
  end
end
