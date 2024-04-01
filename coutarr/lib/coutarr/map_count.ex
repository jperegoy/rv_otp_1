defmodule MapCount do
  @moduledoc """
  Count the number of occurrences of each element in a list.
  """
  def new(str_int) do
    %{
      count: String.to_integer(str_int)
    }
  end

  def increment(%{count: count}) do
    %{count: count + 1}
  end

  def decrement(%{count: count}) do
    %{count: count - 1}
  end

  def show(%{count: count}) do
    "the count is #{count}"
  end
end
