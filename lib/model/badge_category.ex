defmodule GamificationEngine.Model.BadgeCategory do 
    use GamificationEngine.Helper, :model

    schema "badge_categories" do
        
        field :name, :string
        field :description, :string
        has_many :badge, GamificationEngine.Model.Badge
        timestamps()
    end

    @doc false
  def changeset(badge_struct, attrs \\ %{}) do
    badge_struct
    |> cast(attrs, [:name, :description, :points])
    |> validate_required([:name, :description, :points])
  end

end 