defmodule GamificationEngine.Model.Log do 
    use GamificationEngine.Helper, :model
    alias GamificationEngine.Model
 
     schema "logs" do
        belongs_to :user, Model.User
        belongs_to :activity, Model.Activity
        belongs_to :to_user, Model.User, foreign_key: :to_user_id
         
         timestamps()
     end
 
     @doc false
   def changeset(log_struct, attrs \\ %{}) do
     log_struct
   end
 end