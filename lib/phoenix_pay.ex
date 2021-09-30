defmodule PhoenixPay do
  alias PhoenixPay.Users.Create, as: UserCreate
  alias PhoenixPay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
end
