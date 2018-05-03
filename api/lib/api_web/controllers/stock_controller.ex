defmodule ApiWeb.StockController do
  use ApiWeb, :controller

  alias Api.Shopify
  alias Api.Centra
  alias Api.Accounts
  alias Api.Accounts.Client

  def centra(%Plug.Conn{private: %{guardian_user_resource: current_user}} = conn, _params) do
    info = Accounts.get_client!(current_user.id)
    client = Centra.init(info.centra_api_key, info.centra_domain)

    case Centra.get_stock(client) do
      {:ok, env} -> render(conn, "centra.json", stock: env.body)
      {:error, _env} -> render(conn, "error.json")
    end
  end

  def shopify(%Plug.Conn{private: %{guardian_user_resource: current_user}} = conn, _params) do
    info = Accounts.get_client!(current_user.id)
    client = Shopify.init(info.shopify_domain, info.shopify_api_key, info.shopify_secret)
    case Shopify.get_stock(client) do
      {:ok, env} -> render(conn, "shopify.json", products: env.body["products"])
      {:error, _env} -> render(conn, "error.json")
    end
  end
end
