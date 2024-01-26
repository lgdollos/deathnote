defmodule Deathnote.Victim do
  use Ecto.Schema
  import Ecto.Changeset

  schema "victims" do
    field :victim_name, :string
    timestamps()
  end

  def changeset(victim, attrs) do
    victim
    |> cast(attrs, [:victim_name])
    |> validate_required([:victim_name])
    |> validate_length(:victim_name, min: 1, max: 20)
  end
end
