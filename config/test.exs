use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :fae_service, FaeService.Repo,
  url:
    System.get_env(
      "DATABASE_URL",
      "postgres://postgres:postgres@db/fae_test"
    ),
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox,
  timeout: :infinity

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fae_service, FaeServiceWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
