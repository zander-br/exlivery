defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Joe Doe",
          "joe.doe@test.com",
          "123.456.789-00",
          19,
          "620 Eighth Avenue"
        )

      expected_response =
        {:ok,
         %User{
           address: "620 Eighth Avenue",
           age: 19,
           cpf: "123.456.789-00",
           email: "joe.doe@test.com",
           name: "Joe Doe"
         }}

      assert response == expected_response
    end

    test "when user is underage, returns an error" do
      response =
        User.build(
          "Joe Doe",
          "joe.doe@test.com",
          "123.456.789-00",
          15,
          "620 Eighth Avenue"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when user cpf is not a string, returns an error" do
      response =
        User.build(
          "Joe Doe",
          "joe.doe@test.com",
          12_345_678_900,
          19,
          "620 Eighth Avenue"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
