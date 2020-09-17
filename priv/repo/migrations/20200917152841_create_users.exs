defmodule RemotePoints.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :points, :integer

      timestamps()
    end

    create constraint("users", :integer_must_be_between_0_100, check: "points <= 100 AND points >= 0")
  end
end
