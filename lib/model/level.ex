defmodule GamificationEngine.Model.Level do
    use GamificationEngine.Helper, :model

    schema "levels" do
        field :name, :string
        field :description, :string
        field :points_range_start, :integer
        field :points_range_end, :integer
        has_many :user, GamificationEngine.Model.User
        timestamps()
    end


    def changeset(levels_struct, params \\ %{}) do
        levels_struct
        |> cast(params, [:name, :description, :points_range_start, :points_range_end])
        |> validate_required([:name, :description, :points_range_start, :points_range_end])
    end
end