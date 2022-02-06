defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)
    #{_, numeric_component} = volume_pair
    #numeric_component
    # end

  def to_milliliter(volume_pair) do
   
    {unit, numeric_component} = volume_pair
    
    cond do
      unit == :fluid_ounce -> {:milliliter, numeric_component * 30}
      unit == :cup -> {:milliliter, numeric_component * 240}
      unit == :teaspoon -> {:milliliter, numeric_component * 5}
      unit == :tablespoon -> {:milliliter, numeric_component * 15}
      unit == :milliliter ->  volume_pair
      
    end
  end

  def from_milliliter(volume_pair, unit \\ :milliliter) 

  def from_milliliter({_, numeric_component} = volume_pair, :cup = unit), do:  {unit, numeric_component / 240} 

  def from_milliliter({_, numeric_component} = volume_pair, :fluid_ounce = unit), do: {unit, numeric_component / 30}

  def from_milliliter({_, numeric_component} = volume_pair, :teaspoon = unit), do: {unit, numeric_component / 5}

  def from_milliliter({_, numeric_component} = volume_pair, :tablespoon = unit), do: {unit, numeric_component / 15}

  def from_milliliter(volume_pair, _unit), do: volume_pair

  def convert(volume_pair, unit) do 
    KitchenCalculator.to_milliliter(volume_pair)
      |> KitchenCalculator.from_milliliter(unit)
  end
end
