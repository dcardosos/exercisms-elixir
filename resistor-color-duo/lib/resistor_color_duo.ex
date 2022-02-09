defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @map_colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9}

  @spec value(colors :: [atom]) :: integer
  def value([c1 | t]) do
    [c2 | _] = t
    Map.get(@map_colors, c1)
    |> Kernel.*(10)
    |> Kernel.+(Map.get(@map_colors, c2))  
  end

end
