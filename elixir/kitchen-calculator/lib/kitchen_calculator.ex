defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def convert_to_milliliter(:cup, volume) do
    volume * 240
  end

  def convert_to_milliliter(:fluid_ounce, volume) do
    volume * 30
  end

  def convert_to_milliliter(:teaspoon, volume) do
    volume * 5
  end

  def convert_to_milliliter(:tablespoon, volume) do
    volume * 15
  end

  def convert_to_milliliter(:milliliter, volume) do
    volume * 1
  end

  def to_milliliter(volume_pair) do
    volume = convert_to_milliliter(elem(volume_pair, 0), get_volume(volume_pair))
    {:milliliter, volume}
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair) / convert_to_milliliter(unit, 1)
    {unit, volume}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
