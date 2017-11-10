defmodule GamificationEngine.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
  end

  def up do
    create table(:users) do
      add :total_points, :integer
      add :badge_id, references(:badges), null: false
      add :level_id, references(:levels), null: false
      timestamps()
    end
  end

  def down do
    drop table(:users)
  end
end
