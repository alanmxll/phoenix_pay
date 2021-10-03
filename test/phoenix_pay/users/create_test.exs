defmodule PhoenixPay.Users.CreateTest do
  use PhoenixPay.DataCase

  alias PhoenixPay.User
  alias PhoenixPay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Alan",
        password: "123456",
        nickname: "alanmxll",
        email: "alanmxll@mail.com",
        age: 28
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Alan", age: 28, id: ^user_id} = user
    end

    test "when there are invalid, returns an error" do
      params = %{
        name: "Alan",
        nickname: "alanmxll",
        email: "alanmxll@mail.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
