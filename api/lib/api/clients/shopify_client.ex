defmodule Api.Shopify do
  use Tesla

  plug Tesla.Middleware.JSON

  def init(domain, username, password) do
    Tesla.build_client([
      {Tesla.Middleware.BaseUrl, "https://#{domain}"},
      {Tesla.Middleware.Headers, [{"Authorization", "Basic " <> Base.encode64("#{username}:#{password}")}]}
      ])
    end

    def get_stock(client) do
      stock = get(client, "/admin/products.json", query: [fields: [:variants]])
    end

  end
