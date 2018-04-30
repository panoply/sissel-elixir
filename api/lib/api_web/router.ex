defmodule ApiWeb.Router do
  use ApiWeb, :router
  alias Api.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", ApiWeb do
    pipe_through :api

    post "/login", UserController, :sign_in
    # Websites
  end

  scope "/api/v1", ApiWeb do
    pipe_through [:api, :jwt_authenticated]
    resources "/clients", ClientController

  #  resources "/clients", ClientController
  #  resources "/users", UserController
  end
end
