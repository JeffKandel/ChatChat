defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiWeb do
    get "/authors", AuthorController, :index
    get "/channels", ChannelController, :index
    get "/messages", MessageController, :index
    get "/messages/:id", MessageController, :show
    post "/messages", MessageController, :create
    pipe_through :api
  end
end
