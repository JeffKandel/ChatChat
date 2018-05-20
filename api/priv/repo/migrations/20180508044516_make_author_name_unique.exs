defmodule Api.Repo.Migrations.MakeAuthorNameUnique do
  use Ecto.Migration

  def change do
    create unique_index(:authors, [:name])
  end
end
