defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    # Check if same length
    |> Enum.filter(fn x -> String.length(x) == String.length(base) end)
    # Check if word is same/different case
    |> Enum.filter(&(&1 |> String.downcase() != base |> String.downcase()))
    |> Enum.filter(fn x ->
      x
      |> String.downcase()
      |> String.split("", trim: true)
      |> Enum.sort() ==
        base
        |> String.downcase()
        |> String.split("", trim: true)
        |> Enum.sort()
    end)
  end
end
