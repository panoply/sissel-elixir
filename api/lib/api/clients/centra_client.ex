defmodule Api.Centra do
  use Tesla

  plug Tesla.Middleware.JSON

  def init(api_key, domain) do
    Tesla.build_client([
      {Tesla.Middleware.BaseUrl, domain},
      {Tesla.Middleware.Headers, [{"API-Authorization", api_key}]}
    ])
  end

  def get_stock(client) do
    get(client, "/stock")
  end

end
