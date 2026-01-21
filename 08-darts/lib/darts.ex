defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    # Calculate the Euclidean distance from the origin
    # import Erlang :math module for square root calculation
    distance = :math.sqrt(x * x + y * y)

    cond do
      distance > 10 -> 0
      distance > 5 -> 1
      distance > 1 -> 5
      true -> 10
    end
  end
end
