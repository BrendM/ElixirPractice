defmodule Practice do
  import IO, only: [puts: 1]
  @moduledoc false

  def last(list) do
    Enum.at(list, length(list) - 1)
  end

  def elementAt(list, pos) do
    elementAt(list, pos, 0)
  end

  defp elementAt([head|tail], pos, current) do
    if pos == current do
      head
    else
      elementAt(tail, pos, current + 1)
    end
  end

  def myReverse(list) do
    myReverse(list, [])
  end

  defp myReverse([head|tail], newList) do
    myReverse(tail, List.flatten([head, newList]))
  end
  defp myReverse([], newList) do
    newList
  end
end
