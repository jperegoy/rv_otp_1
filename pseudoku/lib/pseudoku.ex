defmodule Pseudoku do
  @moduledoc """
  Documentation for `Pseudoku`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pseudoku.hello()
      :world

  """
  def play(name) do
    DynamicSupervisor.start_child(:dsup, {Pseudoku.Server, name})
  end

  def guess(name, guess) do
    Pseudoku.Server.guess(name, guess)
  end

  def hello do
    :world
  end
end
