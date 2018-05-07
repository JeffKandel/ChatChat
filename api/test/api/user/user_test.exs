defmodule Api.UserTest do
  use Api.DataCase

  alias Api.User

  describe "authors" do
    alias Api.User.Author

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert User.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert User.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = User.create_author(@valid_attrs)
      assert author.image == "some image"
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, author} = User.update_author(author, @update_attrs)
      assert %Author{} = author
      assert author.image == "some updated image"
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_author(author, @invalid_attrs)
      assert author == User.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = User.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> User.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = User.change_author(author)
    end
  end
end
