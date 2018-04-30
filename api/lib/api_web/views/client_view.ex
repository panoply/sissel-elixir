defmodule ApiWeb.ClientView do
  use ApiWeb, :view
  alias ApiWeb.ClientView

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{
      id: client.id,
      company: client.company,
      centra_domain: client.centra_domain,
      centra_api_key: client.centra_api_key,
      shopify_domain: client.shopify_domain,
      shopify_api_key: client.shopify_api_key,
      shopify_secret: client.shopify_secret,
      shopify_webhook: client.shopify_webhook
    }
  end

end
