defmodule Tetris.Brick do

  defstruct [
    name:        :l     ,
    location:    {0, 0} ,
    rotation:    0      ,
    reflection:  false  ,
  ]

  def new() do
    __struct__()
  end

  def new_random() do
    %Tetris.Brick{
      name:        random_name()       ,
      location:    {40, 0}             ,
      rotation:    random_rotation()   ,
      reflection:  random_reflection() ,
    }
  end

  defp random_name(), do: ~w(z l t o i)a |> Enum.random()

  defp random_rotation(), do: [0, 90, 180, 270] |> Enum.random()

  defp random_reflection(), do: [true, false] |> Enum.random()

end
