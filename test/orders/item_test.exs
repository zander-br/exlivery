defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      reponse = Item.build("Pizza Mussarela", :pizza, "42.5", 1)

      expected_response = {:ok, build(:item)}

      assert reponse == expected_response
    end
  end
end
