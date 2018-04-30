# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api,
ecto_repos: [Api.Repo]

# Configures the endpoint
config :api, ApiWeb.Endpoint,
url: [host: "localhost"],
secret_key_base: "IBvkR5ROtqQFHu613fP2uecjpLCLfWUQArYtGS5ed1OsURqN94EM3lQr2LSaeyCc",
render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json)],
pubsub: [name: Api.PubSub,
adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
format: "$time $metadata[$level] $message\n",
metadata: [:request_id]


# Guardian config
config :api, Api.Guardian,
issuer: "api",
secret_key: "XOJ8AZP//z4BEmwN3UPYnGU2Ea9FZaIpN1I8cWdCgL3bm0blhnyoCxVOyYuqtzoV"

# JaSerializer config
config :phoenix, :format_encoders,
"json-api": Poison

#config :mime, :types, %{
#  "application/vnd.api+json" => ["json-api"],
#  "application/xml" => ["xml"]
#}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
