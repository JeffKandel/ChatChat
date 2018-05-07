defmodule ApiWeb.ChannelController do
  use ApiWeb, :controller

  alias Api.Chat
  alias Api.Chat.Channel

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    channels = Chat.list_channels()
    render(conn, "index.json", channels: channels)
  end

  def create(conn, %{"channel" => channel_params}) do
    with {:ok, %Channel{} = channel} <- Chat.create_channel(channel_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", channel_path(conn, :show, channel))
      |> render("show.json", channel: channel)
    end
  end

  def show(conn, %{"id" => id}) do
    channel = Chat.get_channel!(id)
    render(conn, "show.json", channel: channel)
  end

  def update(conn, %{"id" => id, "channel" => channel_params}) do
    channel = Chat.get_channel!(id)

    with {:ok, %Channel{} = channel} <- Chat.update_channel(channel, channel_params) do
      render(conn, "show.json", channel: channel)
    end
  end

  def delete(conn, %{"id" => id}) do
    channel = Chat.get_channel!(id)
    with {:ok, %Channel{}} <- Chat.delete_channel(channel) do
      send_resp(conn, :no_content, "")
    end
  end
end
