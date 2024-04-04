defmodule Pseudoku.Score do
  defstruct reds: 0, whites: 0, blacks: 4

  def new(answer, guess) do
    # Hits
    reds = answer
      |> Enum.zip(guess)
      |> Enum.count(fn { first, second } -> first == second end)

    # Misses
    blacks = length(guess -- answer)

    # Wrongs
    whites = 4 - reds - blacks

    %__MODULE__{reds: reds, whites: whites, blacks: blacks}
  end

  def show(%{reds: r, whites: w, blacks: b}) do
    reds = String.duplicate("🔴 ", r)
    whites = String.duplicate("⚪️ ", w)
    blacks = String.duplicate("⚫️ ", b)

    [reds, whites, blacks]
      |> Enum.reject(fn ch -> ch == "" end)
      |> Enum.join("")
  end
end
