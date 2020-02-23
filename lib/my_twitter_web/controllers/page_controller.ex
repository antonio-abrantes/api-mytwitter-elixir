defmodule MyTwitterWeb.PageController do
  use MyTwitterWeb, :controller

  def home(conn, _params) do
    render(conn, "index.html")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
