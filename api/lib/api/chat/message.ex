defmodule Api.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.User
  alias Api.User.Author
  alias Api.Chat.Channel

  schema "messages" do
    field :content, :string
    belongs_to :author, Author
    belongs_to :channel, Channel

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    author = get_author(attrs)

    message
    |> cast(attrs, [:content, :channel_id])
    |> put_change(:author_id, author.id)
    |> validate_required([:content, :channel_id, :author_id])
  end

  defp get_author(attrs) do
    name = attrs["name"]
    with {:ok, %Author{} = author} <- User.get_author!(name) do
      author
    end
  end
end
