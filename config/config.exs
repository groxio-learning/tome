import Config

config :tome, Tome.Repo,
  database: "tome_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :tome, ecto_repos: [Tome.Repo]