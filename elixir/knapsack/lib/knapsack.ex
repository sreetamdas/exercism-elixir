defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value([], _), do: 0

  def maximum_value([%{weight: first_weight} | rest], maximum_weight)
      when maximum_weight < first_weight do
    maximum_value(rest, maximum_weight)
  end

  def maximum_value([current | rest], maximum_weight) do
    max(
      maximum_value(rest, maximum_weight - current.weight) + current.value,
      maximum_value(rest, maximum_weight)
    )
  end
end
