defmodule Coutarr.Server do
  # __using__/1 macro is called to inject the GenServer behaviour into the module
  use GenServer
  alias Coutarr.MapCount

  # Public API

  # start_link/1 is a function that starts the GenServer process
  def start_link(string) do
    GenServer.start_link(__MODULE__, string, name: :counter)
  end

  def show(pid \\ :counter) do
    GenServer.call(pid, :show)
  end

  def inc(pid \\ :counter) do
    GenServer.cast(pid, :inc)
  end

  def dec(pid \\ :counter) do
    GenServer.cast(pid, :dec)
  end

  # Callbacks

  @impl true
  def init(string) do
    # initial_state = %{count: String.to_integer(count)}
    initial_state = MapCount.new(string)
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:show, _from, counter) do
    to_caller = MapCount.show(counter)
    {:reply, to_caller, counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    new_state = MapCount.increment(counter)
    {:noreply, new_state}
  end

  @impl true
  def handle_cast(:dec, counter) do
    new_state = MapCount.decrement(counter)
    {:noreply, new_state}
  end
end
