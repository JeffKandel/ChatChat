defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiWeb do
    get "/authors", AuthorController, :index
    get "/channels", ChannelController, :index
    get "/messages", MessageController, :index
    pipe_through :api
  end
end
