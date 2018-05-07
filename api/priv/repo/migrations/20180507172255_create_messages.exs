defmodule Api.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :channelId, references(:channels, on_delete: :nothing)
      add :authorId, references(:authors, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:channelId])
    create index(:messages, [:authorId])
  end
end
