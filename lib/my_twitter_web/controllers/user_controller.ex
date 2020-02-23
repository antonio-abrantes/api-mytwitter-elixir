defmodule MyTwitterWeb.UserController do
  use MyTwitterWeb, :controller

  alias MyTwitter.Management
  alias MyTwitter.Management.User

  action_fallback MyTwitterWeb.FallbackController

  def list(conn, _params) do
    users = Management.list_users()
    render(conn, "index.html", users: users)
  end

  def create_new(conn, %{"user" => user_params}) do
    case Management.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User Created!")
        |> redirect(to: Routes.page_path(conn, :home))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  @doc """
    Methods of API
  """

  def index(conn, _params) do
    users = Management.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Management.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Management.get_user!(id)

    with {:ok, %User{} = user} <- Management.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Management.get_user!(id)

    with {:ok, %User{}} <- Management.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
