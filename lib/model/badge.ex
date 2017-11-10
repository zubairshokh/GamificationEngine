defmodule GamificationEngine.Model.Badge do 
   use GamificationEngine.Helper, :model


    schema "badges" do
        
        field :name, :string
        field :description, :string
        field :points, :integer
        has_many :user, GamificationEngine.Model.User
        timestamps()
    end

    @doc false
  def changeset(badge_struct, attrs \\ %{}) do
    badge_struct
    |> cast(attrs, [:name, :description, :points])
    |> validate_required([:name, :description, :points])
  end
end