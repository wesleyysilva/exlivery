defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Wesley",
      email: "wesley@gmail.com.br",
      cpf: "12345678900",
      age: 45,
      address: "Rua 1"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 3
    }
  end

  def order_factory do
    %Order{
      user_cpf: "12345678900",
      delivery_address: "Rua 1",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("147.50")
    }
  end
end
