defmodule PhoenixPay do
  alias PhoenixPay.Users.Create, as: UserCreate
  alias PhoenixPay.Accounts.{Deposit, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
end
