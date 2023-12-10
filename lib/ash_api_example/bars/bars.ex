defmodule AshApiExample.Bars do
  use Ash.Api

  resources do
    resource AshApiExample.Bars.Bar
  end
end
