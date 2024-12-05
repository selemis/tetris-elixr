defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick


  test "greets the world" do
    assert new_brick()  == %Tetris.Brick{name: :l, location: {0, 0}, rotation: 0, reflection: false}
  end


  defp new_brick(), do: new()
end
