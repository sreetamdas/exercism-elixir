defmodule Transpose do
  @doc """
  Given an input text, output it transposed.

  Rows become columns and columns become rows. See https://en.wikipedia.org/wiki/Transpose.

  If the input has rows of different lengths, this is to be solved as follows:
    * Pad to the left with spaces.
    * Don't pad to the right.

  ## Examples

    iex> Transpose.transpose("ABC\\nDE")
    "AD\\nBE\\nC"

    iex> Transpose.transpose("AB\\nDEF")
    "AD\\nBE\\n F"
  """

  @spec transpose(String.t()) :: String.t()
  def transpose(input) do
    input
    |> String.split("\n")
    |> balance_strings()
    |> Enum.zip_reduce([], fn lines, transposed ->
      lines
      |> Enum.join()
      |> String.trim_trailing("*")
      |> then(&Enum.concat(transposed, [&1]))
    end)
    |> Enum.join("\n")
    |> String.replace("*", " ")
  end

  defp balance_strings(lines) do
    lines
    |> Enum.max_by(&String.length/1)
    |> then(fn longest_line ->
      lines
      |> Enum.map(&String.pad_trailing(&1, String.length(longest_line), "*"))
    end)
    |> Enum.map(&String.split(&1, "", trim: true))
  end
end
