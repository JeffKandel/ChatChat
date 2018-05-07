defmodule Api.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :channel_id, references(:channels, on_delete: :nothing)
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:channel_id])
    create index(:messages, [:author_id])
  end
end
