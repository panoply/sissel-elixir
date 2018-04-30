defmodule Api.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Accounts.User

  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    has_many :client, Api.Accounts.Client
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      ])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, hashpwsalt(pass))
      _ ->
          changeset
    end
  end

end
