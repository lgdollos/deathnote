defmodule Deathnote.Repo.Migrations.CreateVictims do
  use Ecto.Migration

  def change do
    create table(:victims) do
      add :victim_name, :string, null: false
      timestamps()
    end

    create unique_index(:victims, [:victim_name])
  end
end
