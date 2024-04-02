defmodule Coutarr.Service do
  alias Coutarr.MapCount

  def start_link(input) do
    count = MapCount.new(input)
    spawn_link(fn -> loop(count) end)
  end

  def increment(pid) do
    send(pid, :inc)
  end

  def decrement(pid) do
    send(pid, :dec)
  end

  def show(pid, from_pid) do
    send(pid, {:show, from_pid})
  end

  def loop(count) do
    count
    |> listen()
    |> loop()
  end

  def inc(counter_pid) do
    send(counter_pid, :inc)
  end

  def dec(counter_pid) do
    send(counter_pid, :dec)
  end

  def show(counter_pid) do
    send(counter_pid, {:show, self()})

    receive do
      msg -> msg
    end
  end

  def listen(count) do
    receive do
      :inc ->
        MapCount.increment(count)

      :dec ->
        MapCount.decrement(count)

      {:show, from_pid} ->
        send(from_pid, MapCount.show(count))
        count
    end
  end
end
