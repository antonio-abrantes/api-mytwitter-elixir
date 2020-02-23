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

  # Other scopes may use custom stacks.
  scope "/api", MyTwitterWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/tweets", TweetController, except: [:new, :edit]
    get "/tweets/user/:user_id", TweetController, :show_all_by_id
  end
end
