defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    # displacement
    :math.pow(x, 2)
    |> Kernel.+(:math.pow(y, 2))
    |> :math.sqrt()
    |> then(
      &cond do
        &1 > 10 -> 0
        &1 > 5 -> 1
        &1 > 1 -> 5
        true -> 10
      end
    )
  end
end
