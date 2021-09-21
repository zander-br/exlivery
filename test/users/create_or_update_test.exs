defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Joe Doe",
        email: "joe.doe@test.com",
        cpf: "123.456.789-00",
        age: 19,
        address: "620 Eighth Avenue"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Joe Doe",
        email: "joe.doe@test.com",
        cpf: "123.456.789-00",
        age: 15,
        address: "620 Eighth Avenue"
      }

      response = CreateOrUpdate.call(params)

      expected_reponse = {:error, "Invalid parameters"}

      assert response == expected_reponse
    end
  end
end
