defmodule BirdCount do
  def today(list) do
    list
    |> Enum.at(0, nil)
  end

  def increment_day_count(list) when length(list) == 0 do
    [1]
  end

  def increment_day_count(list) do
    list
    |> List.update_at(0, &(&1 + 1))
  end

  def has_day_without_birds?(list) do
    list
    |> Enum.any?(fn x -> x == 0 end)
  end

  def total(list) do
    list
    |> Enum.sum()
  end

  def busy_days(list) do
    list |> Enum.count(fn x -> x >= 5 end)
  end
end
