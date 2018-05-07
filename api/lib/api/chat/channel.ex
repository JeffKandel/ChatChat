defmodule Api.Chat.Channel do
  use Ecto.Schema
  import Ecto.Changeset


  schema "channels" do
    field :name, :string
    has_many :messages, Api.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
