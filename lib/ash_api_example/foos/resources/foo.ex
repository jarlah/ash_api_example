defmodule AshApiExample.Foos.Foo do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "foos"
    repo AshApiExample.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string

    attribute :bar_id, :uuid
  end

  relationships do
    belongs_to :bar, AshApiExample.Bars.Bar
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  code_interface do
    define_for AshApiExample.Foos
    define :create
    define :read
    define :by_id, get_by: [:id], action: :read
    define :update
    define :destroy
  end
end
