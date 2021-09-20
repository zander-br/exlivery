defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Pudim",
          category: :sobremesa,
          quantity: 2,
          unity_price: Decimal.new("3.40")
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is not items in the order, returns an error" do
      user = build(:user)
      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is not user in the order, return an error" do
      items = [
        build(:item),
        build(:item,
          description: "Pudim",
          category: :sobremesa,
          quantity: 2,
          unity_price: Decimal.new("3.40")
        )
      ]

      response = Order.build("invalid_user", items)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
