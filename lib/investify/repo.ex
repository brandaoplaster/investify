defmodule Investify.Repo do
  use Ecto.Repo,
    otp_app: :investify,
    adapter: Ecto.Adapters.Postgres
end
