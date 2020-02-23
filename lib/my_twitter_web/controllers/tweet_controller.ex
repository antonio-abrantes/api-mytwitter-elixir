defmodule MyTwitterWeb.TweetController do
  use MyTwitterWeb, :controller

  import Ecto.Query
  alias MyTwitter.Repo

  alias MyTwitter.Management
  alias MyTwitter.Management.Tweet
  alias MyTwitter.Management.User

  action_fallback MyTwitterWeb.FallbackController

  def index(conn, _params) do
    tweets = Management.list_tweets()
    render(conn, "index.json", tweets: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Management.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Management.get_tweet!(id)
    render(conn, "show.json", tweet: tweet)
  end

  def show_all_by_id(conn, %{"user_id" => user_id}) do
    query = from u in Tweet,
    where: u.user_id == ^user_id,
    select: u

    tweets = Repo.all(query)
    render(conn, "index.json", tweets: tweets)
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Management.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Management.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Management.get_tweet!(id)

    with {:ok, %Tweet{}} <- Management.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end
end
