defmodule GamificationEngine.Repo.Migrations.Log do
  use Ecto.Migration

  def change do
  end

  def up do
    create table(:logs) do
      add :user_id, references(:users), null: false
      add :activity_id, references(:activities), null: false
      add :to_user_id, references(:users), null: false
      timestamps()
    end
  end

  def down do
    drop table(:logs)
  end
end
