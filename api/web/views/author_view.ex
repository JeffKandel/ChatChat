defmodule Api.AuthorView do
  use Api.Web, :view

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, Api.AuthorView, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, Api.AuthorView, "author.json")}
  end

  def render("author.json", %{author: author}) do
    %{id: author.id,
      name: author.name,
      image: author.image}
  end
end
