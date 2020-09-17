defmodule RemotePoints.Repo do
  use Ecto.Repo,
    otp_app: :remote_points,
    adapter: Ecto.Adapters.Postgres
end
