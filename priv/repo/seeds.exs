# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RemotePoints.Repo.insert!(%RemotePoints.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for _n <- 0..99, do: RemotePoints.Repo.insert!(%RemotePoints.Points.User{})
