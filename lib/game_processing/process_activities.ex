defmodule GameProcessing.ProcessActivities do
    alias GamificationEngine.{Repo, Model}
    import Ecto.Query

    def activity_done(activity, from_userid,  on_userid) do
        to_activity(activity, from_userid, on_userid)
    end

    defp to_activity(:joined, userid, _) do
        activity_struct=get_activity("New User")
        badge_struct=Repo.one(from b in Model.Badge, where: b.name=="Naive")
        level_struct=Repo.one(from l in Model.Level, where: l.name=="Novice")

       user=%Model.User{}
        |>Map.put(:id, userid)
        |>Map.put(:total_points, activity_struct.points)
        |>Map.put(:badge, badge_struct)
        |>Map.put(:level, level_struct)
        |>Repo.insert!
        
        enter_log(user, activity_struct, Repo.get(Model.User, 0))
         user
    end

    defp to_activity(:followed, userid, on_userid) do
        activity_struct=get_activity("Followed User") 
        add_points(userid, activity_struct, on_userid) 
    end

    defp to_activity(:uploadphoto, userid, on_userid) do
        activity_struct=get_activity("Upload Photo") 
        add_points(userid, activity_struct, on_userid)     
    end

    defp to_activity(:socialshare, userid, on_userid) do
        activity_struct=get_activity("Social Share") 
        add_points(userid, activity_struct, on_userid)     
    end

    defp to_activity(:likephoto, userid, on_userid) do
        activity_struct=get_activity("Like Photo") 
        add_points(userid, activity_struct, on_userid)     
    end

    defp add_points(from_user_id, activity_struct, on_userid) do
        user= Repo.get(Model.User, from_user_id)
        on_user= Repo.get(Model.User, on_userid)         
            user
            |> Ecto.Changeset.change(total_points: user.total_points + activity_struct.points)
            |> Repo.update!

        enter_log(user, activity_struct, on_user)
        user
    end


    defp get_activity(activity_name) do
                Repo.one(from a in Model.Activity, where: a.name==^activity_name)        
    end

    defp enter_log(user, activity_struct, on_user) do
        log=Model.Log.create_log_struct(user, activity_struct, on_user)
        GenServer.cast(Mygenserver, {:enter_log, log})
    end
end
