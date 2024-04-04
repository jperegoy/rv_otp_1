defmodule Pseudoku.Board do
  defstruct answer: [1, 2, 3, 4], history: []
  alias Pseudoku.Score

  def new(answer \\ get_random_answer()) do
    %__MODULE__{answer: answer}
  end

  defp get_random_answer() do
    Enum.shuffle(1..8) |> Enum.take(4)
  end

  def guess(board, guess) do
    %__MODULE__{board | history: [ guess | board.history ]}
  end

  def show(board) do
    blank_count = 10 - Enum.count(board.history)
    blanks = String.duplicate("◽️◽️◽️◽️\n", blank_count)

    rows = board.history
      |> Enum.map(fn row -> show_row(board.answer, row) end)
      # |> Enum.reverse()
      |> Enum.join("\n")

    """
    #{blanks}
    #{rows}

    #{status(board)}
    """
  end

  defp show_row(answer, [a, b, c, d] = guess) do
    """
    #{a} #{b} #{c} #{d} | #{Score.new(answer, guess) |> Score.show()}
    """
  end

  defp status(board) do
    cond do
      board.answer in board.history -> "won"
      length(board.history) >= 10 -> "lost"
      true -> "playing"
    end
  end
end
