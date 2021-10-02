defmodule PhoenixPayWeb.AccountsController do
  use PhoenixPayWeb, :controller

  alias PhoenixPay.Account

  action_fallback PhoenixPayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- PhoenixPay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- PhoenixPay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
