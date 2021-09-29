defmodule PhoenixPayWeb.UsersController do
  use PhoenixPayWeb, :controller

  alias PhoenixPay.User

  action_fallback PhoenixPayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- PhoenixPay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
