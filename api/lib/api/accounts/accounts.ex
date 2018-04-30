defmodule Api.Accounts do

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Accounts.Client

  @doc """
  Returns the list of clients.

  ## ISSUE
    Preloading Users Here

  """
  def list_clients do
    Repo.all(Client)
  end

  def get_client!(id), do: Repo.get!(Client, id)


  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end


  def change_client(%Client{} = client) do
    Client.changeset(client, %{})
  end


  alias Api.Accounts.User

  alias Api.Guardian
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def token_sign_in(email, password) do
    case email_password_auth(email, password) do
      {:ok, user} ->
        Guardian.encode_and_sign(user)
      _ ->
        {:error, :unauthorized}
    end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    with {:ok, user} <- get_by_email(email),
    do: verify_password(password, user)
  end

  defp get_by_email(email) when is_binary(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        dummy_checkpw()
        {:error, "Login error."}
      user ->
        {:ok, user}
    end
  end

  defp verify_password(password, %User{} = user) when is_binary(password) do
    if checkpw(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end


  def list_users do
    User
    |> Repo.all()
    |> Repo.preload(:client)
  end


  # List users by Client
  def list_users_by_company(client_id) do
    User
    |> Ecto.Query.preload([:client])
    |> where(client_id: ^client_id)
    |> Repo.all()
  end

  def get_user!(id) do
    User
    |> Ecto.Query.preload([:client])
    |> Repo.get!(id)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end


  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end


  def delete_user(%User{} = user) do
    Repo.delete(user)
  end


  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

end
