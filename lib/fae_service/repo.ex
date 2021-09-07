defmodule FaeService.Repo do
  use Ecto.Repo,
    otp_app: :fae_service,
    adapter: Ecto.Adapters.Postgres
end
