defmodule DeathnoteWeb.VictimController do
  use DeathnoteWeb, :controller
  alias Deathnote.Victims
  alias Deathnote.Victim

  def home(conn, _params) do
    render(conn, "home.html")
  end

  def index(conn, params) do
    changeset = Victims.new_victim(%Victim{})
    victims = Victims.paginate_victims(params)
    render(conn, "index.html", victims: victims, changeset: changeset)
  end

  def create(conn, %{"victim" => victim_params}) do
    victims = Victims.paginate_victims(victim_params)

    case Victims.create_victim(victim_params) do
      {:ok, _victim} ->
        conn
        |> redirect(to: Routes.victim_path(conn, :index, page: victims.total_pages))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:victims, victims)
        |> assign(:changeset, changeset)
        |> redirect(to: Routes.victim_path(conn, :index, page: victims.total_pages))
    end
  end
end
