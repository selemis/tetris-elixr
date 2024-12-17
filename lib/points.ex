defmodule Tetris.Points do


  def move_by(points, {x, y}) do
    points
      |> Enum.map( fn {px, py} -> {px + x, py + y} end)
  end

  def rotate_90(points), do: points |> transpose |> mirror_on_y()

  def transpose(points), do: points |> Enum.map(&transpose_point/1)

  def mirror_on_y(points), do: points |> Enum.map(&mirror_point_on_y/1)

  def mirror_on_x(points), do: points |> Enum.map(&mirror_point_on_x/1)

  defp transpose_point({x, y}), do: {y, x}

  defp mirror_point_on_y({x, y}), do: {5 - x, y}

  defp mirror_point_on_x({x, y}), do: {x, 5 - y}

end
