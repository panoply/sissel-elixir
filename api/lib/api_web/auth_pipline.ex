defmodule Api.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :Api,
  module: Api.Guardian,
  error_handler: Api.AuthErrorHandler, key: :user

  plug Guardian.Plug.VerifyHeader, realm: "Bearer", key: :user
  plug Guardian.Plug.EnsureAuthenticated, key: :user
  plug Guardian.Plug.LoadResource, key: :user
end
