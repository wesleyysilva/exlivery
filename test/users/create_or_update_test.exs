defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Wesley",
        address: "Rua 1",
        email: "wesley@gmail.com.br",
        cpf: "98765432100",
        age: 45
      }

      response = CreateOrUpdateUser.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Wesley",
        address: "Rua 1",
        email: "wesley@gmail.com.br",
        cpf: "98765432100",
        age: 10
      }

      response = CreateOrUpdateUser.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
