defmodule Api.MessageView do
  use Api.Web, :view

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, Api.MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, Api.MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      contact: message.contact,
      channelId: message.channelId,
      authorId: message.authorId}
  end
end
