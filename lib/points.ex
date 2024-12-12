defmodule Tetris.Points do


  def move_by(points, {x, y}) do
    points
      |> Enum.map( fn {px, py} -> {px + x, py + y} end)
  end

end
