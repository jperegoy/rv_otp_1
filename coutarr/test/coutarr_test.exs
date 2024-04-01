import MapCount

defmodule CoutarrTest do
  use ExUnit.Case
  doctest Coutarr

  test "greets the world" do
    assert Coutarr.hello() == :world
  end

  test "map count" do
    map_count = MapCount.new("0")
    assert MapCount.show(map_count) == "the count is 0"
    map_count = MapCount.increment(map_count)
    assert MapCount.show(map_count) == "the count is 1"
    map_count = MapCount.decrement(map_count)
    assert MapCount.show(map_count) == "the count is 0"
  end
end
