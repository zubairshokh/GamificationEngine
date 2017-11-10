defmodule GamificationEngine.Model.Activity do 
    use GamificationEngine.Helper, :model
 
 
     schema "activities" do
         
         field :name, :string
         field :description, :string
         field :points, :integer
         has_many :log, GamificationEngine.Model.Log
         timestamps()

     end
 
     @doc false
   def changeset(activity_struct, attrs \\ %{}) do
     activity_struct
     |> cast(attrs, [:name, :description, :points])
     |> validate_required([:name, :description, :points])
   end
 end