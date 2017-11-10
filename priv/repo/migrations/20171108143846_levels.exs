defmodule GamificationEngine.Repo.Migrations.Levels do
  use Ecto.Migration

  def change do
  end

  def up do
    create table(:levels) do
      add :name, :string
      add :description, :string
      add :points_range, :string
      timestamps() 
    end
  end

  def down do
    drop table(:levels)
  end

end
