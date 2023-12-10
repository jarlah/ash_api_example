defmodule AshApiExampleWeb.FoosTest do
  use AshApiExample.DataCase, async: true

  alias AshApiExample.Foos.Foo
  alias AshApiExample.Bars.Bar

  describe "works to load relationships even if there is no api defined in them" do
    test "foo can load its bar relationship" do
      bar1 = Bar.create!(%{name: "Bar 1"})
      foo1 = Foo.create!(%{name: "Foo 1", bar_id: bar1.id})
      assert %Ash.NotLoaded{field: :bar, type: :relationship} == foo1.bar
      foo1 = AshApiExample.Foos.load!(foo1, [:bar])
      assert %Bar{name: "Bar 1"} = foo1.bar
    end
  end
end
