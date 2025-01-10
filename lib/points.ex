defmodule Tetris.Points do

  def move_by(points, {x, y}) do
    points
      |> Enum.map( fn {px, py} -> {px + x, py + y} end)
  end

  def rotate_90(points), do: points |> transpose |> mirror_on_y()
  def rotate_90(points, 0), do: points
  def rotate_90(points, 90), do: rotate_90(points)
  def rotate_90(points, 180), do: points |> rotate_90 |> rotate_90
  def rotate_90(points, 270), do: points |> rotate_90(180) |> rotate_90()

  def transpose(points), do: points |> Enum.map(&transpose_point/1)

  def mirror_on_y(points), do: points |> Enum.map(&mirror_point_on_y/1)
  def mirror_on_y(points, false), do: points
  def mirror_on_y(points, true), do: points |> mirror_on_y()

  def mirror_on_x(points), do: points |> Enum.map(&mirror_point_on_x/1)

  def to_string(points) do
    map =
      points
        |> Enum.map(fn point -> { point, "X" } end)
        |> Map.new

    for y <- (1..4), x <- (1..4) do
      Map.get(map, {x, y}, "O")
    end
    |> Enum.chunk_every(4)
    |> Enum.map(&Enum.join/1)
    |> Enum.join("\n")
  end

  def print(points) do
    points
      |> __MODULE__.to_string
      |> IO.puts

    points
  end

  defp transpose_point({x, y}), do: {y, x}

  defp mirror_point_on_y({x, y}), do: {5 - x, y}

  defp mirror_point_on_x({x, y}), do: {x, 5 - y}

end
