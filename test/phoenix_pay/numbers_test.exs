defmodule PhoenixPay.NumbersTest do
  use ExUnit.Case

  alias PhoenixPay.Numbers

  describe "sum_from_file/1" do
    test "should return the sum of numbers from the file when there is one with the given name" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "should return an error when there is no file with the given name" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid file!"}}

      assert response == expected_response
    end
  end
end
