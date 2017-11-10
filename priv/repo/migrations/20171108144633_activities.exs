defmodule GamificationEngine.Repo.Migrations.Activities do
  use Ecto.Migration

  def change do
  end

  def up do
    create table(:activities) do
      add :name, :string
      add :description, :string
      add :points, :integer
      timestamps() 
    end
  end

  def down do
    drop table(:activities)
  end
end
