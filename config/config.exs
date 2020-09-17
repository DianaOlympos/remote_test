# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :remote_points,
  ecto_repos: [RemotePoints.Repo]

# Configures the endpoint
config :remote_points, RemotePointsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nPwX/4ed59VlGwy40dLuddrFRis5x8FWI/TQuFz+42iZ9zaYj/W4M/3Uvi8hpOGv",
  render_errors: [view: RemotePointsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RemotePoints.PubSub,
  live_view: [signing_salt: "R/ZeuRn9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
