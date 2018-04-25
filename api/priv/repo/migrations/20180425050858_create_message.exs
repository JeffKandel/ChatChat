defmodule Api.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :contact, :string, null: false
      add :channelId, references(:channels, on_delete: :nothing), null: false
      add :authorId, references(:authors, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:messages, [:id])
    create index(:messages, [:id])
  end
end
