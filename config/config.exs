# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fae_service,
  ecto_repos: [FaeService.Repo]

# Configures the endpoint
config :fae_service, FaeServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nug2rE8n6E6I3ho/A6TLVPUb3Li9BWToCS4bxECP0Y2bxJDHynlS4F+uFrW/Q3tR",
  render_errors: [view: FaeServiceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FaeService.PubSub,
  live_view: [signing_salt: "dTVANSse"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :fae_service, FaeServiceWeb.Auth.Guardian,
  issuer: "fae_service",
  secret_key: "unq7CJLcrMyQ3ExHyO791FdOFlCFnUnsQNpXvl+JzMPu+dw80e6/uZdjr20Qn4I3"
