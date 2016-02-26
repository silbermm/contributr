# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :contributr, Contributr.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "3FkXgiOiiSG8iXsvY8lNt63Y4Rua4502/OxD13zdhkXwCjLlcXGEsrdeGAN0pJQt",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Contributr.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Contributr.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Contributr.GuardianSerializer,
  secret_key: to_string(Mix.env),
  hooks: GuardianDb,
  permissions: %{
    default: [
      :read_profile,
      :write_profile,
      :read_token,
      :revoke_token,
    ],
  }

config :ueberauth, Ueberauth,
  providers: [
 		google: {Ueberauth.Strategy.Google, []} 
	]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
	client_id: System.get_env("GOOGLE_CLIENT_ID"),
	client_secret: System.get_env("GOOGLE_CLIENT_SECRET")	

config :guardian_db, GuardianDb,
	repo: Contribur.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
