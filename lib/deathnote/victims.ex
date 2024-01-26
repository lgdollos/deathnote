defmodule Deathnote.Victims do
  @moduledoc """
  The Victims context
  """

  alias Deathnote.Repo
  alias Deathnote.Victim
  import Ecto.Query, warn: false

  def list_victims do
    q = from v in Victim, order_by: [asc: v.inserted_at]
    Repo.all(q)
  end

  def new_victim(%Victim{} = victim) do
    Victim.changeset(victim, %{})
  end

  def create_victim(victim_params \\ %{}) do
    %Victim{}
    |> Victim.changeset(victim_params)
    |> Repo.insert()
  end

  def paginate_victims(params) do
    Repo.paginate(Victim, params)
  end
end
