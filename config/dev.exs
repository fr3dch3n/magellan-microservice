use Mix.Config

config :microservice,
  port: 4000

  config :logger,
    level: :debug,
    truncate: 4096
