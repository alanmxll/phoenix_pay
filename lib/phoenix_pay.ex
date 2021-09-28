defmodule PhoenixPay do
  alias PhoenixPay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
