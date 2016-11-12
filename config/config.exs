# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peepchat,
  ecto_repos: [Peepchat.Repo]

# Configures the endpoint
config :peepchat, Peepchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rkQTFg3QykZztA/5oPP6ADdvXgp+tNGtuqCYj/MMEAniJc4dTr9z/W5kAVh2m0m8",
  render_errors: [view: Peepchat.ErrorView, accepts: ~w(json)],
  pubsub: [name: Peepchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures mime type
config :phoenix, :format_encoders,
	"json-api": Poison

config :mime, :types, %{
	"application/vnd.api+json" => ["json-api"]
}

config :guardian, Guardian,
  allowed_algos: ["HS512"], #optional
  verify_module: Guardian.JWT, # optional
  issuer: "Peepchat",
  ttl: {30, :days},
  verify_issuer: true, #optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "qeKKuPyAEtvkJA5XShIo+QbyLVJWthp60Lq/zLO1hi14RN1WzG1xf6CbVNFpi4BN",
  serializer: Peepchat.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
