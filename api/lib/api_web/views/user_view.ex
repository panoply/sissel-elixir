defmodule ApiWeb.UserView do
  use ApiWeb, :view
  alias ApiWeb.UserView
  alias ApiWeb.ClientView


  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end


  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      companies: render_one(user.client, ClientView, "client.json", as: :client)
    }
  end

  # JWT Token
  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
