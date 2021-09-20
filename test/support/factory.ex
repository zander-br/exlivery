defmodule Exlivery.Factory do
  use ExMachina

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
end
