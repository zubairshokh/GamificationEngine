defmodule GamificationEngine.Model.Level do
    use GamificationEngine.Helper, :model

    schema "levels" do
        field :name, :string
        field :description, :string
        field :points_range, :string
        has_many :user, GamificationEngine.Model.User
        timestamps()
    end


    def changeset(levels_struct, params \\ %{}) do
        levels_struct
        |> cast(params, [:name, :description, :points_range])
        |> validate_required([:name, :description, :points_range])
    end
end