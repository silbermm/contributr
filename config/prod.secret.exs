use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :contributr, Contributr.Endpoint,
  secret_key_base: "igxCIjo4v/7cgcq+QQdGKWvGmQGotMcfmq/2oPNfreMum0CY1arCYhkaK0nR3Bje"

# Configure your database
config :contributr, Contributr.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "contributr_prod",
  pool_size: 20
