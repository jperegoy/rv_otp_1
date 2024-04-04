defmodule Arnie.Rover do
  defstruct location: {0, 0}, heading: :north, history: []

  def new do
    # __struct__()
    %__MODULE__{}
  end

  def forward(rover) do
    %{
      rover
      | history: [rover.location | rover.history],
        location: move(rover.location, rover.heading)
    }
  end

  def left(%{heading: h} = rover) do
    case h do
      :north -> %{rover | heading: :west}
      :west -> %{rover | heading: :south}
      :south -> %{rover | heading: :east}
      :east -> %{rover | heading: :north}
    end
  end

  def right(%{heading: h} = rover) do
    case h do
      :north -> %{rover | heading: :east}
      :west -> %{rover | heading: :north}
      :south -> %{rover | heading: :west}
      :east -> %{rover | heading: :south}
    end
  end

  def show(rover) do
    Bot.show(rover)
  end

  defp move({x, y}, :north) do
    {x, y - 1}
  end

  defp move({x, y}, :south) do
    {x, y + 1}
  end

  defp move({x, y}, :east) do
    {x + 1, y}
  end

  defp move({x, y}, :west) do
    {x - 1, y}
  end
end
