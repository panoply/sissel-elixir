defmodule Api.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :user_id, references(:users)
      add :company, :string
      add :centra_domain, :string
      add :centra_api_key, :string
      add :shopify_domain, :string
      add :shopify_api_key, :string
      add :shopify_secret, :string
      add :shopify_webhook, :string
      timestamps()
    end
  end
end
