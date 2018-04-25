defmodule Sling.Router do
  use Sling.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Sling do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Sling do
    pipe_through :api

    post "/messages", MessageController, :create
    get "/messages", MessageController, :index
  end
end
