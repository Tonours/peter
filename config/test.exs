use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :peter, Peter.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :peter, Peter.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "peter_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
