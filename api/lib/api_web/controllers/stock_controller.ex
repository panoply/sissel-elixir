defmodule ApiWeb.StockController do
  use ApiWeb, :controller

  alias Api.Centra
  alias Api.Accounts
  alias Api.Accounts.Client

  def centra(%Plug.Conn{private: %{guardian_user_resource: current_user}} = conn, _params) do
    info = Accounts.get_client!(current_user.id)
    client = Centra.init(info.centra_domain, info.centra_api_key)

    case Centra.get_stock(client) do
      {:ok, env} -> render(conn, "centra.json", stock: env.body)
      {:error, _env} -> render(conn, "error.json")
    end
  end
end
