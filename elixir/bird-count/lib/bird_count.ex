defmodule BirdCount do
  def today([]), do: nil
  def today([t | _]), do: t

  def increment_day_count([]), do: [1]
  def increment_day_count([t | r]), do: [t + 1 | r]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | r]), do: has_day_without_birds?(r)

  def total([]), do: 0
  def total([t | r]), do: t + total(r)

  def busy_days([]), do: 0
  def busy_days([t | r]) when t >= 5, do: 1 + busy_days(r)
  def busy_days([_ | r]), do: busy_days(r)
end
