defmodule Api.Centra do
  use Tesla

  plug Tesla.Middleware.DecodeJson

  def get_stock(client) do
    get(client, "/stock")
  end

  # build dynamic client based on runtime arguments
  def client(domain, key) do
    Tesla.build_client [
      { Tesla.Middleware.BaseUrl, domain },
      { Tesla.Middleware.Headers, [{"API-Authorization", key }] }
    ]
  end

end
