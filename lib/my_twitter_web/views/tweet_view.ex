defmodule MyTwitterWeb.TweetView do
  use MyTwitterWeb, :view
  alias MyTwitterWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{id: tweet.id,
      user_id: tweet.user_id,
      text: tweet.text,
      likes: tweet.likes,
      created_at: tweet.created_at}
  end
end
