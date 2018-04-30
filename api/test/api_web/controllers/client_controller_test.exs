defmodule ApiWeb.ClientControllerTest do
  use ApiWeb.ConnCase

  alias Api.Accounts
  alias Api.Accounts.Client

  @create_attrs %{company_name: "some company_name", country: "some country", service: "some service"}
  @update_attrs %{company_name: "some updated company_name", country: "some updated country", service: "some updated service"}
  @invalid_attrs %{company_name: nil, country: nil, service: nil}

  def fixture(:client) do
    {:ok, client} = Accounts.create_client(@create_attrs)
    client
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clients", %{conn: conn} do
      conn = get conn, client_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create client" do
    test "renders client when data is valid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, client_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "company_name" => "some company_name",
        "country" => "some country",
        "service" => "some service"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update client" do
    setup [:create_client]

    test "renders client when data is valid", %{conn: conn, client: %Client{id: id} = client} do
      conn = put conn, client_path(conn, :update, client), client: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, client_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "company_name" => "some updated company_name",
        "country" => "some updated country",
        "service" => "some updated service"}
    end

    test "renders errors when data is invalid", %{conn: conn, client: client} do
      conn = put conn, client_path(conn, :update, client), client: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete client" do
    setup [:create_client]

    test "deletes chosen client", %{conn: conn, client: client} do
      conn = delete conn, client_path(conn, :delete, client)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, client_path(conn, :show, client)
      end
    end
  end

  defp create_client(_) do
    client = fixture(:client)
    {:ok, client: client}
  end
end
