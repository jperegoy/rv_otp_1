defmodule Bot do
  @width 10
  @height 10

  def show(contents) do
    """
    <svg
      width="200" height="200"
      xmlns="http://www.w3.org/2000/svg">
      #{draw(contents)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end
  def draw([]), do: ""
  def draw([head|tail]), do: draw(head) <> draw(tail)

  def draw({bot_x, bot_y}) do
    x = 100 + bot_x * @width
    y = 100 + bot_y * @height

    ~s[<circle cx="#{x}" cy="#{y}" r="#{@width/2}" fill="black" />]
  end

  def draw(%{history: history}=bot) do
    """
    #{draw(history)}
    #{bot |> Map.delete(:history) |> draw()}
    """
  end

  def draw(%{heading: :east, location: point}) do
    p1 = point |> locate() |> shift({0, 0})
    p2 = point |> locate() |> shift({-5, -5})
    p3 = point |> locate() |> shift({-5, 5})
    ~s[<polygon
        points="#{poly_point(p1)} #{poly_point(p2)} #{poly_point(p3)}"
        style="fill:blue" />]
  end
  def draw(%{heading: :west, location: point}) do
    p1 = point |> locate() |> shift({-5, 0})
    p2 = point |> locate() |> shift({0, -5})
    p3 = point |> locate() |> shift({0, 5})
    ~s[<polygon
        points="#{poly_point(p1)} #{poly_point(p2)} #{poly_point(p3)}"
        style="fill:blue" />]
  end
  def draw(%{heading: :north, location: point}) do
    p1 = point |> locate() |> shift({0, -5})
    p2 = point |> locate() |> shift({-5, 0})
    p3 = point |> locate() |> shift({5, 0})
    ~s[<polygon
        points="#{poly_point(p1)} #{poly_point(p2)} #{poly_point(p3)}"
        style="fill:blue" />]
  end
  def draw(%{heading: :south, location: point}) do
    p1 = point |> locate() |> shift({0, 0})
    p2 = point |> locate() |> shift({-5, -5})
    p3 = point |> locate() |> shift({5, -5})
    ~s[<polygon
        points="#{poly_point(p1)} #{poly_point(p2)} #{poly_point(p3)}"
        style="fill:blue" />]
  end

  defp locate({x, y}), do: {(100 + x * @width), (100 + y * @height)}

  defp shift({x, y}, {dx, dy}), do: {x + dx, y + dy}

  defp poly_point({x, y}), do: "#{x},#{y}"

end
