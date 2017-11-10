defmodule GamificationEngine.Model.User do
    use GamificationEngine.Helper, :model
    alias GamificationEngine.Model

    schema "users" do

     field :total_points, :integer
     belongs_to :badge, Model.Badge
     belongs_to :level, Model.Level
     has_many :log, Model.Log
     timestamps()

    end


    def changeset(users_struct, attrs \\ %{}) do
        users_struct 
        |> cast(attrs, [:total_points])
        |> validate_required([:total_points])

    end

end