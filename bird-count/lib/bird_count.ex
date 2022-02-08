defmodule BirdCount do
  def today([head |_] = list) when is_list(list) do
    head
  end
  def today(_list), do: nil 

  def increment_day_count([head | tail] = list) when length(list) > 0 do
    [head + 1 | tail]
  end
  def increment_day_count(_list), do: [1]

  def has_day_without_birds?(list) do
    Enum.any?(list, fn x -> x == 0 end)
  end
  #def has_day_without_birds?([]), do: false
  #def has_day_without_birds?([0 | _]), do: true
  #def has_day_without_birds?([_ | t]), do: has_day_without_birds?(t)

  def total([]), do: 0
  def total([head | tail]) do
    head + total(tail)
    #Enum.reduce(list, fn x, y -> x + y end)
  end
  

  def busy_days(list) do
    Enum.count(list, fn x -> x >= 5 end)
  end
end
