defmodule Tome.Repo do
  use Ecto.Repo,
    otp_app: :tome,
    adapter: Ecto.Adapters.Postgres
end
