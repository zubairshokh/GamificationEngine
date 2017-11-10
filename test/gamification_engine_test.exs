defmodule GamificationEngineTest do
  use ExUnit.Case
  doctest GamificationEngine

  test "greets the world" do
    assert GamificationEngine.hello() == :world
  end
end
