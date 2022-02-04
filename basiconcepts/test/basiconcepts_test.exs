defmodule BasiconceptsTest do
  use ExUnit.Case
  doctest Basiconcepts

  test "greets the world" do
    assert Basiconcepts.hello() == :world
  end
end
