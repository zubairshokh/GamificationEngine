defmodule GamificationEngine.Helper do
    
    @moduledoc """
  A module that keeps using definitions for models,
  views and so on.

  This can be used in your application as:

      use GamificationEngine.Helper, :model
      use GamificationEngine.Helper, :view

  The definitions below will be executed for every view,
  model, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end


  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end