defmodule Api.AccountTest do
  use Api.DataCase

  alias Api.Account

  describe "clients" do
    alias Api.Account.Client

    @valid_attrs %{company_name: "some company_name", country: "some country", service: "some service"}
    @update_attrs %{company_name: "some updated company_name", country: "some updated country", service: "some updated service"}
    @invalid_attrs %{company_name: nil, country: nil, service: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Account.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Account.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Account.create_client(@valid_attrs)
      assert client.company_name == "some company_name"
      assert client.country == "some country"
      assert client.service == "some service"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Account.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.company_name == "some updated company_name"
      assert client.country == "some updated country"
      assert client.service == "some updated service"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_client(client, @invalid_attrs)
      assert client == Account.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Account.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Account.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Account.change_client(client)
    end
  end
end
