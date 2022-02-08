defmodule Recursion do
    def times(x, y) when y > 0 do
        x + times(x, y - 1)
    end

    def times(_x, 0) do
        0
    end
end