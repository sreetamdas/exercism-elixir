defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer

  @points_map %{
    "aeioulnrst" => 1,
    "dg" => 2,
    "bcmp" => 3,
    "fhvwy" => 4,
    "k" => 5,
    "jx" => 8,
    "qz" => 10
  }

  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn letter, score ->
      letter_key =
        @points_map
        |> Map.keys()
        |> Enum.find(fn letters ->
          String.contains?(letters, letter)
        end)

      letter_point =
        @points_map
        |> Map.get(letter_key, 0)

      score + letter_point
    end)
  end
end
