defmodule GamificationEngine.GameEvaluation.GameGenserver do
    use GenServer

    def start_link do
     GenServer.start_link(__MODULE__, :ok, name: Mygenserver)  # :ok as state
    end

    def  init(state) do
        {:ok, state}
    end

    def handle_cast(:cast, state) do

      {:noreply, "cast"}
    end 

    def handle_cast({:enter_log, log}, state) do
        GameEvaluation.ProcessEvaluation.enter_log(log)
      {:noreply, "cast"}
    end 
    
    def handle_call(:call, _from, state) do
        {:reply, "call", ""}
    end
end