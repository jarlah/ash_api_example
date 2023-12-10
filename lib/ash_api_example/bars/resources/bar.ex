defmodule AshApiExample.Bars.Bar do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "bars"
    repo AshApiExample.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  code_interface do
    define_for AshApiExample.Bars
    define :create
    define :read
    define :by_id, get_by: [:id], action: :read
    define :update
    define :destroy
  end
end
