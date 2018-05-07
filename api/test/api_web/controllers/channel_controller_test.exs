defmodule ApiWeb.ChannelControllerTest do
  use ApiWeb.ConnCase

  alias Api.Chat
  alias Api.Chat.Channel

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:channel) do
    {:ok, channel} = Chat.create_channel(@create_attrs)
    channel
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all channels", %{conn: conn} do
      conn = get conn, channel_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create channel" do
    test "renders channel when data is valid", %{conn: conn} do
      conn = post conn, channel_path(conn, :create), channel: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, channel_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, channel_path(conn, :create), channel: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update channel" do
    setup [:create_channel]

    test "renders channel when data is valid", %{conn: conn, channel: %Channel{id: id} = channel} do
      conn = put conn, channel_path(conn, :update, channel), channel: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, channel_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, channel: channel} do
      conn = put conn, channel_path(conn, :update, channel), channel: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete channel" do
    setup [:create_channel]

    test "deletes chosen channel", %{conn: conn, channel: channel} do
      conn = delete conn, channel_path(conn, :delete, channel)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, channel_path(conn, :show, channel)
      end
    end
  end

  defp create_channel(_) do
    channel = fixture(:channel)
    {:ok, channel: channel}
  end
end
