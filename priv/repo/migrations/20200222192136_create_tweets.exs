defmodule MyTwitter.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :user_id, references(:users)
      add :text, :string
      add :likes, :integer
      add :created_at, :naive_datetime

      timestamps()
    end

  end
end
