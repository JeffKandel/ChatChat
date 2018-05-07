defmodule ApiWeb.MessageView do
  use ApiWeb, :view
  alias ApiWeb.MessageView

  def render("index.json", %{messages: messages}) do
    render_many(messages, MessageView, "message.json")
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      content: message.content,
      channelId: message.channelId,
      authorId: message.authorId,
      }
  end
end
