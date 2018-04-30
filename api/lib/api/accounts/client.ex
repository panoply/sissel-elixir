defmodule Api.Accounts.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :company, :string
    field :centra_domain, :string
    field :centra_api_key, :string
    field :shopify_domain, :string
    field :shopify_api_key, :string
    field :shopify_secret, :string
    field :shopify_webhook, :string
    belongs_to :user, Api.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [
      :company,
      :centra_domain,
      :centra_api_key,
      :shopify_domain,
      :shopify_api_key,
      :shopify_secret,
      :shopify_webhook
      ])
    |> validate_required([
      :company,
      :centra_domain,
      :centra_api_key, 
      :shopify_domain,
      :shopify_api_key,
      :shopify_secret,
      :shopify_webhook
      ])
  end
end
