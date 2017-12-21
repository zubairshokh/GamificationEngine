defmodule GameEvaluation.ProcessEvaluation do
    alias GamificationEngine.{Repo, Model}
    import Ecto.Query

    def enter_log(log) do
        Repo.insert!(log)
    end
end