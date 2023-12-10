defmodule AshApiExample.Repo do
  use AshPostgres.Repo,
    otp_app: :ash_api_example

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
