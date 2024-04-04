defmodule Pseudoku.Server do
  use GenServer
  alias Pseudoku.Board

  # client
  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  # Rewrite to allow multiple services to run concurrently
  def child_spec(name) do
    %{id: name, start: {Pseudoku.Server, :start_link, [name]}}
  end

  def guess(pid, input) do
    GenServer.call(pid, {:guess, input}) |> IO.puts()
  end


  # server
  def init(name) do
    IO.puts("Starting #{name}'s game")
    {:ok, Board.new()}
  end

  def handle_call({:guess, input}, _from, board) do
    new_board = Board.guess(board, input)
    {:reply, Board.show(new_board), new_board}
  end
end
