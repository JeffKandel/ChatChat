defmodule Api.ChannelView do
  use Api.Web, :view

  def render("index.json", %{channels: channels}) do
    %{data: render_many(channels, Api.ChannelView, "channel.json")}
  end

  def render("show.json", %{channel: channel}) do
    %{data: render_one(channel, Api.ChannelView, "channel.json")}
  end

  def render("channel.json", %{channel: channel}) do
    %{id: channel.id,
      name: channel.name}
  end
end
