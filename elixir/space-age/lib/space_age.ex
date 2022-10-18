defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_seconds = 31_557_600.0
    earth_years = seconds / earth_seconds

    case planet do
      :mercury ->
        earth_years / 0.2408467

      :venus ->
        earth_years / 0.61519726

      :earth ->
        earth_years / 1.0

      :mars ->
        earth_years / 1.8808158

      :jupiter ->
        earth_years / 11.862615

      :saturn ->
        earth_years / 29.447498

      :uranus ->
        earth_years / 84.016846

      :neptune ->
        earth_years / 164.79132
    end
  end
end
