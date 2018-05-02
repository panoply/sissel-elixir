defmodule Api.Client do
  @callback init(api_key :: String.t()) :: client :: Tesla.Client.t()
  @callback get_stock(client :: Tesla.Client.t()) :: env :: Tesla.Env.t()
end
