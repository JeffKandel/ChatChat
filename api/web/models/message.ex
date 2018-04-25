defmodule Api.Message do
  use Api.Web, :model

  schema "messages" do
    field :contact, :string
    belongs_to :channelId, Api.ChannelId, foreign_key: :channelId_id
    belongs_to :authorId, Api.AuthorId, foreign_key: :authorId_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:contact])
    |> validate_required([:contact])
  end
end
