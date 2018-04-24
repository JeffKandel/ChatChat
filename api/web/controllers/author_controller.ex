# defmodule Api.AuthorController do
#   use Api.Web, :controller

#   alias Api.Author

#   def index(conn, _params) do
#     authors = Repo.all(Author)
#     render(conn, "index.json", authors: authors)
#   end

#   def create(conn, %{"author" => author_params}) do
#     changeset = Author.changeset(%Author{}, author_params)

#     case Repo.insert(changeset) do
#       {:ok, author} ->
#         conn
#         |> put_status(:created)
#         |> put_resp_header("location", author_path(conn, :show, author))
#         |> render("show.json", author: author)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(Api.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def show(conn, %{"id" => id}) do
#     author = Repo.get!(Author, id)
#     render(conn, "show.json", author: author)
#   end

#   def update(conn, %{"id" => id, "author" => author_params}) do
#     author = Repo.get!(Author, id)
#     changeset = Author.changeset(author, author_params)

#     case Repo.update(changeset) do
#       {:ok, author} ->
#         render(conn, "show.json", author: author)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(Api.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def delete(conn, %{"id" => id}) do
#     author = Repo.get!(Author, id)

#     # Here we use delete! (with a bang) because we expect
#     # it to always work (and if it does not, it will raise).
#     Repo.delete!(author)

#     send_resp(conn, :no_content, "")
#   end
# end
