defmodule GamificationEngine.Model.Log do 
    use GamificationEngine.Helper, :model
    alias GamificationEngine.Model
 
     schema "logs" do
        belongs_to :user, Model.User #, foreign_key: :user_id
        belongs_to :activity, Model.Activity #, foreign_key: :activity_id
        belongs_to :to_user, Model.User #, foreign_key: :to_user_id
         
         timestamps()
     end
 
     @doc false
   def changeset(log_struct, attrs \\ %{}) do
    IO.inspect log_struct
     log_struct
   end

   def create_log_struct(user, activity, to_user) do
     %Model.Log{}
    |> Map.put(:user, user)
    |> Map.put(:activity, activity)
    |> Map.put(:to_user, to_user)
   end
 end