defmodule ArnieTest do
  use ExUnit.Case
  doctest Arnie

  test "greets the world" do
    assert Arnie.hello() == :world
  end
end
