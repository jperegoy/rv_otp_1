defmodule CoutarrTest.Int do
  use ExUnit.Case

  test "test main" do
    assert Coutarr.Int.new(1) == 1
  end

  test "test increment" do
    result = Coutarr.Int.new(1) |> Coutarr.Int.increment() |> Coutarr.Int.show()
    assert result == 2
  end

  test "test decrement" do
    result = Coutarr.Int.new(1) |> Coutarr.Int.increment() |> Coutarr.Int.increment() |> Coutarr.Int.decrement() |> Coutarr.Int.show()
    assert result == 2
  end

  test "test show" do
    result = Coutarr.Int.new(1) |> Coutarr.Int.show()
    assert result == 1
  end
end
