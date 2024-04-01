defmodule Coutarr.Int do
  @moduledoc """
  Documentation for `Coutarr`.
  """

  @doc """
  This function creates a new integer, increments twice, decrements once and shows the value.

  ## Examples

      iex> Coutarr.Int.new(1) |> Coutarr.Int.increment() |> Coutarr.Int.increment() |> Coutarr.Int.decrement() |> Coutarr.Int.show()
      2

  """
  def new(value) do
    value
  end

  def increment(value) do
    value + 1
  end

  def decrement(value) do
    value - 1
  end

  def show(value) do
    value
  end
end
