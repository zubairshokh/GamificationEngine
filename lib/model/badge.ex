defmodule GamificationEngine.Model.Badge do 
   use GamificationEngine.Helper, :model
   alias GamificationEngine.Model

    schema "badges" do
        
        field :name, :string
        field :description, :string
        field :awardpoints, :integer
        field :condition, :integer
        belongs_to :badge_category, Model.BadgeCategory
        has_many :user, GamificationEngine.Model.User
        timestamps()
    end

    @doc false
  def changeset(badge_struct, attrs \\ %{}) do
    badge_struct
    |> cast(attrs, [:name, :description, :awardpoints, :condition])
    |> validate_required([:name, :description, :awardpoints, :condition])
  end
end