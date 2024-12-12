defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick

  test "create a new brick" do
    assert new_brick()  == %Tetris.Brick{name: :l, location: {40, 0}, rotation: 0, reflection: false}
  end

  test "create a new random brick" do
    actual = new_random()

    assert actual.name in [:z, :l, :o, :t, :i]
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end

  test "movement" do
    actual =
      new_brick()
        |> move_left()
        |> move_left()
        |> move_down()
        |> spin_90()
        |> spin_90()

    assert actual.location == { 38, 1 }
    assert actual.rotation == 180
  end



  defp new_brick(), do: new()
end
