defmodule Geom do
  def area(X Y) do
    X * Y
  end
  
  #I don't actually know if elixir allows this whole guards in function declaration thing
  def area(Shape, X, Y) when X >= 0, Y >= 0 do
    case Shape do
      :triangle -> area(X, Y) / 2
      :ellipse  -> area(X, Y) * :math.pi()
      _         -> area(X, Y)
    end
  end
end