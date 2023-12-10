defmodule AshApiExample.Foos do
  use Ash.Api

  resources do
    resource AshApiExample.Foos.Foo
  end
end
