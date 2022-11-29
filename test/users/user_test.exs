defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Wesley", "Rua 1", "wesley@gmail.com.br", "12345678900", 45)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, return an error" do
      response = User.build("Wesley", "Rua 1", "wesley@gmail.com.br", "12345678990", 17)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
