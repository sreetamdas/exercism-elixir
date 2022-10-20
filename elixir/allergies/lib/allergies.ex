defmodule Allergies do
  @items_list [
    :eggs,
    :peanuts,
    :shellfish,
    :strawberries,
    :tomatoes,
    :chocolate,
    :pollen,
    :cats
  ]

  @spec decimal_to_binary(non_neg_integer) :: [String.t()]
  defp decimal_to_binary(input) do
    Integer.to_string(input, 2)
  end

  @spec get_allergic_items(non_neg_integer) :: [atom]
  defp get_allergic_items(score) do
    decimal_to_binary(score)
    |> String.split("", trim: true)
    |> Enum.reverse()
    |> Enum.take(length(@items_list))
    |> Enum.with_index()
    |> Enum.reduce([], fn {x, index}, flag_list ->
      case x do
        "1" -> flag_list ++ [@items_list |> Enum.at(index) |> Atom.to_string()]
        "0" -> flag_list
      end
    end)
  end

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    get_allergic_items(flags)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    get_allergic_items(flags)
    |> Enum.member?(item)
  end
end
