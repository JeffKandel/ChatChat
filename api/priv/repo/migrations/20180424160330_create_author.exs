defmodule Api.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string, null: false
      add :image, :string, default: "https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png"

      timestamps()
    end

     create unique_index(:authors, [:name])
  end
end
