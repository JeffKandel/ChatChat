defmodule Api.AuthorTest do
  use Api.ModelCase

  alias Api.Author

  @valid_attrs %{image: "some image", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Author.changeset(%Author{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Author.changeset(%Author{}, @invalid_attrs)
    refute changeset.valid?
  end
end
