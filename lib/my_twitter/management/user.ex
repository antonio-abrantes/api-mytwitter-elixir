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
    |> unique_constraint(:name)
    |> validate_length(:name, min: 5, max: 100)
    |> validate_length(:password, min: 4)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
  end
end
