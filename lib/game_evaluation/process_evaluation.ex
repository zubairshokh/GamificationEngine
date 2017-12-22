defmodule GameEvaluation.ProcessEvaluation do
    alias GamificationEngine.{Repo, Model}
    import Ecto.Query

    def enter_log(log) do
        Repo.insert!(log)
        check_for_badges(log.user.id)
    end

    def check_for_badges(user_id) do
        logs=Repo.all(Model.Log)
        check_badge(:checkbadge, user_id, logs)
    end

    defp check_badge(:checkbadge, user_id, logs) do
        ### ETS can be used here for large data
        activities=Repo.all(from l in Model.Log, where: l.activity_id != 1 and l.user_id==^user_id, group_by: [l.user_id, l.activity_id], select: [l.activity_id, count(l.id)])
        user=Repo.get(Model.User,user_id) |> Repo.preload([:badge, :level])
        badges=Repo.all(Model.Badge)  
            activities
            |> Enum.each(fn(data) -> 
                [activity, count]=data 
                    condition="activity:#{activity},count:#{count}" 
                 cond_satisfied=badges
                         |> Enum.filter(fn(badge) -> 
                            badge.condition == condition                            
                        end)
                        case length(cond_satisfied) do
                            1 -> 
                                Ecto.Changeset.change(user, [badge_id: Kernel.hd(cond_satisfied).id,
                                                             total_points: user.total_points + Kernel.hd(cond_satisfied).awardpoints])
                                    |> Repo.update
                            _ -> 
                        end       
        end)

        check_level(user)
    end

    def check_level(user) do
        Repo.all(Model.Level)
            |> Enum.each(fn(data) -> 
                %Model.Level{points_range_start: start, points_range_end: endp, id: lid}=data
                cond do
                    user.total_points > start and user.total_points < endp -> 
                        Ecto.Changeset.change(user, [level_id: lid ])
                                    |> Repo.update
                    true -> 
                end
            end)
    end
end