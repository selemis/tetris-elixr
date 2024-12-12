defmodule Tetris.Brick do

  defstruct [
    name:        :l      ,
    location:    {40, 0} ,
    rotation:    0       ,
    reflection:  false   ,
  ]

  def new() do
    __struct__()
  end

  def new_random() do
    %{ new() |
      name:        random_name()       ,
      rotation:    random_rotation()   ,
      reflection:  random_reflection() ,
    }

  end

  def move_left(brick), do: %{ brick | location: point_left(brick.location) }

  def move_right(brick), do: %{ brick | location: point_right(brick.location) }

  def move_down(brick), do: %{ brick | location: point_down(brick.location) }

  def spin_90(brick), do: %{ brick | rotation: rotate(brick.rotation) }


  def points(%{name: :l}) do
    [
      {2, 1},
      {2, 2},
      {2, 3}, {3, 3}
    ]
  end

  def points(%{name: :i}) do
    [
      {2, 1},
      {2, 2},
      {2, 3}
      {2, 4}
    ]
  end

  def points(%{name: :o}) do
    [
      {2, 2}, {3, 2},
      {2, 3}, {3, 3}
    ]
  end

  def points(%{name: :z}) do
    [
      {2, 2},
      {2, 3}, {3, 3},
              {3, 4}
    ]
  end

  def points(%{name: :z}) do
    [
      {2, 2},
      {2, 3}, {3, 3},
      {2, 4}
    ]
  end

  defp random_name(), do: ~w(z l t o i)a |> Enum.random()

  defp random_rotation(), do: [0, 90, 180, 270] |> Enum.random()

  defp random_reflection(), do: [true, false] |> Enum.random()

  defp point_left({ x, y }), do: { x-1, y }

  defp point_right({ x, y }), do: { x + 1, y }

  defp point_down({ x, y}), do: { x, y + 1 }

  defp rotate(270), do: 0
  defp rotate(degrees), do: degrees + 90

end
