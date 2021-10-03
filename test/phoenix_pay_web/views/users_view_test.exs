defmodule PhoenixPayWeb.UsersViewTest do
  use PhoenixPayWeb.ConnCase

  import Phoenix.View

  alias PhoenixPay.{Account, User}
  alias PhoenixPayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Alan",
      password: "123456",
      nickname: "alanmxll",
      email: "alanmxll@mail.com",
      age: 28
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      PhoenixPay.create_user(params)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        id: user_id,
        name: "Alan",
        nickname: "alanmxll"
      }
    }

    response = render(UsersView, "create.json", user: user)

    assert expected_response == response
  end
end
