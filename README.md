# MyTwitter Api

Using:

  * Elixir v1.10 released
  * Phoenix Framework v1.4.14
  * Ecto v3.1

To start this project:

  * git clone this repository
  * Configure database params in ./config/dev.exs
    ```
      # Configure your database
      config :project_name, ProjectName.Repo,
      username: "username",
      password: "password",
      database: "database_name",
      hostname: "host",
      show_sensitive_data_on_connection_error: true,
      pool_size: 10
    ``` 
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Execute this command seeds for insert data demo in database `mix run priv\repo\seeds\user_seeds.exs` and `mix run priv\repo\seeds\tweet_seeds.exs`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Tests routs and models
  * Using Postman or Insomnia
  * Methods and Routes
  <table>
  <thead>
    <th>Method</th>
    <th>Route</th>
  </thead>
  <tbody>
    <tr>
      <td>GET</td>
    <td>http://localhost:4000/api/users</td>
    </tr>
    <tr>
      <td>GET</td>
      <td>http://localhost:4000/api/users/:id</td>
    </tr>
    <tr>
      <td>POST</td>
      <td>http://localhost:4000/api/users</td>
    </tr>
    <tr>
      <td>GET</td>
      <td>http://localhost:4000/api/tweets</td>
    </tr>
    <tr>
      <td>GET</td>
      <td>http://localhost:4000/api/tweets/:id</td>
    </tr>
    <tr>
      <td>POST</td>
      <td>http://localhost:4000/api/tweets</td>
    </tr>
    <tr>
      <td>GET</td>
      <td>http://localhost:4000/api/tweets/user/:user_id</td>
    </tr>
  </tbody>
</table>

* Models
  ```
  {"user":
    {
      "name": "name",
      "nickname": "nickname",
      "email": "email@email.com",
      "password": "1234"
    }
  }

  {"tweet": 
    {
      "user_id": 20, 
      "text": "First tweet test",
      "likes": 12,
      "created_at": "2020-02-22 19:54:41"
    }
  }
  
  ```

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
