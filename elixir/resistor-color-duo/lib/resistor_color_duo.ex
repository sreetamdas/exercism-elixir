defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    for color <- colors do
      case color do
        :black ->
          0

        :brown ->
          1

        :red ->
          2

        :orange ->
          3

        :yellow ->
          4

        :green ->
          5

        :blue ->
          6

        :violet ->
          7

        :grey ->
          8

        :white ->
          9

        _ ->
          :error
      end
    end
  end
end
