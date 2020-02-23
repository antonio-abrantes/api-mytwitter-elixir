defmodule MyTwitterWeb.Router do
  use MyTwitterWeb, :router

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

  scope "/", MyTwitterWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/tweet/new", TweetController, :new
    get "/tweets", TweetController, :list
    get "/tweets/:id", TweetController, :list_by_id
    post "/tweet", TweetController, :create_new
    get "/users", UserController, :list
    get "/user/new", UserController, :new
    post "/user", UserController, :create_new
    delete "/user", UserController, :delete

  end

  # Other scopes may use custom stacks.
  scope "/api", MyTwitterWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :create, :show]
    resources "/tweets", TweetController, only: [:index, :create, :show]
    get "/tweets/user/:user_id", TweetController, :show_all_by_id
  end
end
