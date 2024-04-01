defmodule Coutarr.Structarr do
  defstruct count: 0

  def new(initial_value) do
    %__MODULE__{count: String.to_integer(initial_value)}
  end

  def show(input) do
    "the ant are is #{input.count}"
  end

  def increment(input) do
    %__MODULE__{count: input.count + 1}
  end

  def decrement(input) do
    %__MODULE__{count: input.count - 1}
  end
end
