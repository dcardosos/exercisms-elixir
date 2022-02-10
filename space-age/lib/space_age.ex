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

  @planets %{
    mercury: 0.2408467, 
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158, 
    jupiter: 11.862615,
    saturn: 29.447498, 
    uranus: 84.016846, 
    neptune: 164.79132
  }         
  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    cond do
      planet in Map.keys(@planets) ->
        {:ok,
        seconds / 60 / 60 / 24 / 365.25
        |> Kernel./(Map.get(@planets, planet)) 
        |> Float.ceil(4)
      } 
      true -> {:error, "not a planet"}
    end
  end
end
