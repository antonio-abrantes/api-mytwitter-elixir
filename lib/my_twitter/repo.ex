defmodule MyTwitter.Repo do
  use Ecto.Repo,
    otp_app: :my_twitter,
    adapter: Ecto.Adapters.Postgres
end
