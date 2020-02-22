defmodule MyTwitter.Management.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :nickname, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :nickname, :email, :password])
    |> validate_required([:name, :nickname, :email, :password])
  end
end
