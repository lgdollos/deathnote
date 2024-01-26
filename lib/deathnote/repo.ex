defmodule Deathnote.Repo do
  use Ecto.Repo,
    otp_app: :deathnote,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 13
end
