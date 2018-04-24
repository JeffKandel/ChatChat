defmodule Api.Author do
  use Api.Web, :model

  schema "authors" do
    field :name, :string
    field :image, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :image])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
