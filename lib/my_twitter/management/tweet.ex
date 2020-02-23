defmodule MyTwitter.Management.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :created_at, :naive_datetime
    field :likes, :integer
    field :text, :string
    # field :user_id, :integer

    belongs_to :user, MyTwitter.Management.User

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:user_id, :text, :likes, :created_at, :user_id])
    |> validate_required([:user_id, :text, :created_at])
    |> validate_length(:text, min: 5, max: 240)
  end
end
