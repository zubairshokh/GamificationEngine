defmodule GamificationEngine.Repo.Migrations.BadgeCategories do
  use Ecto.Migration

  def change do
  end


  def up do
    create table(:badge_categories) do
      add :name, :string
      add :description, :string
      timestamps()
    end
  end

  def down do
    drop table(:badge_categories)
  end
end
