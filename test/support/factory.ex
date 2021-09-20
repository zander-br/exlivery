defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Joe Doe",
      email: "joe.doe@test.com",
      cpf: "123.456.789-00",
      age: 19,
      address: "620 Eighth Avenue"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza Mussarela",
      category: :pizza,
      unity_price: Decimal.new("42.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "620 Eighth Avenue",
      items: [
        build(:item),
        build(:item,
          description: "Pudim",
          category: :sobremesa,
          quantity: 2,
          unity_price: Decimal.new("3.40")
        )
      ],
      total_price: Decimal.new("49.30"),
      user_cpf: "123.456.789-00"
    }
  end
end
