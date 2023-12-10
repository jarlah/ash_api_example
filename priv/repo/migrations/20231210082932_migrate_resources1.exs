defmodule AshApiExample.Repo.Migrations.MigrateResources1 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:foos, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("uuid_generate_v4()"), primary_key: true
      add :name, :text
      add :bar_id, :uuid
    end

    create table(:bars, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("uuid_generate_v4()"), primary_key: true
    end

    alter table(:foos) do
      modify :bar_id,
             references(:bars,
               column: :id,
               name: "foos_bar_id_fkey",
               type: :uuid,
               prefix: "public"
             )
    end

    alter table(:bars) do
      add :name, :text
    end
  end

  def down do
    alter table(:bars) do
      remove :name
    end

    drop constraint(:foos, "foos_bar_id_fkey")

    alter table(:foos) do
      modify :bar_id, :uuid
    end

    drop table(:bars)

    drop table(:foos)
  end
end