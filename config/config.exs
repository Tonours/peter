# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peter,
  ecto_repos: [Peter.Repo]

# Configures the endpoint
config :peter, Peter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ScgiMkcu7qm2oWX2TuGil32pGzrftI8XcDuLn/dG+Qs/DR9rDb2QeuvXDAwyN73R",
  render_errors: [view: Peter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Peter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian configuration
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Peter",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "f/VxYgdq2sHJmZyufte4/QS2IkJHF5oclVmoCvdfGBozBTk/a4Z6TXyCyL2XtSyt",
  serializer: Peter.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
