defmodule CoutarrStructTest do
  use ExUnit.Case
  alias Coutarr.Structarr

  test "new function returns struct" do
    assert Structarr.new("42") == %Structarr{count: 42}
  end

  test "increment should increment count by 1" do
    assert (Structarr.new("42") |> Structarr.increment()) == %Structarr{count: 43}
  end

  test "decrement should decrement count by 1" do
    assert (Structarr.new("42") |> Structarr.increment()) == %Structarr{count: 41}
  end

  test "show should return string with count" do
    assert Structarr.show(%Structarr{count: 42}) == "the ant are is 42"
  end
end
