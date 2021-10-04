defmodule PhoenixPayWeb.AccountsControllerTest do
  use PhoenixPayWeb.ConnCase, async: true

  alias PhoenixPay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Alan",
        password: "123456",
        nickname: "alanmxll",
        email: "alanmxll@mail.com",
        age: 28
      }

      {:ok, %User{account: %Account{id: account_id}}} = PhoenixPay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YWxhbm14bGw6cGhvZW5peDEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.0"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Ballance changed successfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "test"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end

  describe "withdraw/2" do
    setup %{conn: conn} do
      params = %{
        name: "Alan",
        password: "123456",
        nickname: "alanmxll",
        email: "alanmxll@mail.com",
        age: 28
      }

      {:ok, %User{account: %Account{id: account_id}}} = PhoenixPay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YWxhbm14bGw6cGhvZW5peDEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the withdraw", %{conn: conn, account_id: account_id} do
      params = %{"value" => "0.0"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "0.00", "id" => _id},
               "message" => "Ballance changed successfully"
             } = response
    end

    test "when all balance is 0.00 (zero), should return a error", %{
      conn: conn,
      account_id: account_id
    } do
      params = %{"value" => "50.0"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"balance" => ["is invalid"]}}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "test"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid withdraw value!"}

      assert response == expected_response
    end
  end
end
