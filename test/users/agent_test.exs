defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "98765432100"

      {:ok, cpf: cpf}
    end

    test "when the user is found, return the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           name: "Wesley",
           address: "Rua 1",
           email: "wesley@gmail.com.br",
           cpf: "98765432100",
           age: 45
         }}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      response = UserAgent.get("00000000000")

      expectd_response = {:error, "User not found"}

      assert expectd_response == response
    end
  end
end
