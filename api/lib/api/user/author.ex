defmodule Api.User.Author do
  use Ecto.Schema
  import Ecto.Changeset


  schema "authors" do
    field :image, :string
    field :name, :string
    has_many :messages, Api.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
