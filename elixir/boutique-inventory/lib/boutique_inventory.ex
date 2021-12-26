defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort(&(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(fn x -> x.price == nil end)
  end

  def increase_quantity(item, count) do
    item
    |> Map.update(:quantity_by_size, %{}, fn quantity_by_size ->
      quantity_by_size
      |> Enum.map(fn {size, quantity} -> {size, quantity + count} end)
      |> Enum.into(%{})
    end)
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size, %{})
    |> Map.values()
    |> Enum.sum()
  end
end
