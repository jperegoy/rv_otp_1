defmodule Arnie.Server do
  # __using__/1 macro is called to inject the GenServer behaviour into the module
  use GenServer
  alias Arnie.Rover

  # Public API

  # start_link/1 is a function that starts the GenServer process
  def start_link(_input) do
    GenServer.start_link(__MODULE__, :unused, name: :rover)
  end

  def forward(pid \\ :rover) do
    GenServer.call(pid, :forward)
  end

  def left(pid \\ :rover) do
    GenServer.call(pid, :left)
  end

  def right(pid \\ :rover) do
    GenServer.call(pid, :right)
  end

  # Callbacks

  @impl true
  def init(_unused) do
    initial_state = Rover.new()
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:forward, _from, rover) do
    to_caller = Rover.forward(rover)
    {:reply, to_caller, to_caller}
  end

  def handle_call(:left, _from, rover) do
    to_caller = Rover.left(rover)
    {:reply, to_caller, to_caller}
  end

  def handle_call(:right, _from, rover) do
    to_caller = Rover.right(rover)
    {:reply, to_caller, to_caller}
  end
end
