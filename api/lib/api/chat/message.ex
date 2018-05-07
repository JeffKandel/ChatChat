defmodule Api.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :content, :string
    field :channelId, :id
    field :authorId, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
