defmodule PhoenixPay.Users.Create do
  alias PhoenixPay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
