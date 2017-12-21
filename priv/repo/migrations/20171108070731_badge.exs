defmodule GamificationEngine.Repo.Migrations.Badge do
  use Ecto.Migration

  def change do
  end

  def up do
    create table(:badges) do
      add :name, :string
      add :description, :string
      add :awardpoints, :integer
      add :condition, :integer
      add :badge_category_id, references(:badge_categories), null: false
      timestamps()
    end
  end

  def down do
    drop table(:badges)
  end
end
