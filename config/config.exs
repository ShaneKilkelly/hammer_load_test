# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :hammer_load_test, HammerLoadTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8deESZvWE7ul8in3e6UBGf5gDONPMvXceTMDAk74XdLMSi69pI18Ow5IJOwu/Rhy",
  render_errors: [view: HammerLoadTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HammerLoadTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]


# Configure Hammer

# config :hammer,
#   backend: {Hammer.Backend.ETS, [expiry_ms: 60_000 * 5,
#                                  cleanup_interval_ms: 60_000 * 6
#                                  ]}

config :hammer,
  backend: {Hammer.Backend.Redis, [expiry_ms: 60_000 * 5,
                                   redix_config:
                                    [host: System.get_env("REDIS_HOST")]
                                  ]}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
