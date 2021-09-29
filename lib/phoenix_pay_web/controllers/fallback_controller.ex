defmodule PhoenixPayWeb.FallbackController do
  use PhoenixPayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PhoenixPayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
