defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """

  @color_bands %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    colors
    |> List.pop_at(-1)
    |> case do
      {last, bands} ->
        reading =
          bands
          |> Enum.map(&Map.get(@color_bands, &1))
          |> Integer.undigits()

        tens =
          @color_bands
          |> Map.get(last)

        (reading * Integer.pow(10, tens))
        |> then(fn x ->
          cond do
            div(x, 1000) > 0 -> {div(x, 1000), :kiloohms}
            true -> {x, :ohms}
          end
        end)
    end
  end
end
