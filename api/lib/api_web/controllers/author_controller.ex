defmodule ApiWeb.AuthorController do
  use ApiWeb, :controller

  alias Api.User
  alias Api.User.Author

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    authors = User.list_authors()
    render(conn, "index.json", authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, %Author{} = author} <- User.create_author(author_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", author_path(conn, :show, author))
      |> render("show.json", author: author)
    end
  end

  def show(conn, %{"id" => id}) do
    author = User.get_author!(id)
    render(conn, "show.json", author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = User.get_author!(id)

    with {:ok, %Author{} = author} <- User.update_author(author, author_params) do
      render(conn, "show.json", author: author)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = User.get_author!(id)
    with {:ok, %Author{}} <- User.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
