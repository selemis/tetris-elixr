defmodule PointsTest do

  use ExUnit.Case

  import Tetris.Points
  alias Tetris.Brick

  test "move points by {x, y}" do
    points =
      Brick.new(name: :l)
        |> Brick.points()
        |> move_by({1, 2})

    assert {3, 3} in points
    assert {3, 4} in points
    assert {3, 5} in points
    assert {4, 5} in points
    assert {2, 1} not in points
  end

  test "points transformations" do
    [{1, 1}]
      |> mirror_on_y()
      |> assert_point({4, 1})
      |> mirror_on_x()
      |> assert_point({4, 4})
      |> rotate_90()
      |> assert_point({1, 4})
      |> rotate_90()
      |> assert_point({1, 1})
  end

  defp assert_point([actual], expected) do
    assert actual == expected
    [actual]
  end
end
