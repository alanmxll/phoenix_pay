defmodule PhoenixPay.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_pay,
    adapter: Ecto.Adapters.Postgres
end
