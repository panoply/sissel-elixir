defmodule ApiWeb.ClientController do
  use ApiWeb, :controller

  alias Api.Centra
  alias Api.Accounts
  alias Api.Accounts.Client

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    clients = Accounts.list_clients()
    render(conn, "index.json", clients: clients)
  end

  def create(conn, %{"client" => client_params}) do
    with {:ok, %Client{} = client} <- Accounts.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", client_path(conn, :show, client))
      |> render("show.json", client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Accounts.get_client!(id)
    render(conn, "show.json", client: client)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Accounts.get_client!(id)

    with {:ok, %Client{} = client} <- Accounts.update_client(client, client_params) do
      render(conn, "show.json", client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Accounts.get_client!(id)
    with {:ok, %Client{}} <- Accounts.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end
