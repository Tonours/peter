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

# Arc configuration
config :arc,
  storage: Arc.Storage.S3, # or Arc.Storage.Local
  bucket: {:system, "S3_BUCKET_NAME"},
  virtual_host: true

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: "us-west-2",
  host: "s3-us-west-2.amazonaws.com",
  s3: [
    scheme: "https://",
    host: "s3-us-west-2.amazonaws.com",
    region: "us-west-2"
  ]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
