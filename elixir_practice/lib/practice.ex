defmodule Practice do
  import IO, only: [puts: 1]
  @moduledoc false

  def last(list) do
    Enum.at(list, length(list) - 1)
  end

  def elementAt(list, pos) do
    elementAt(list, pos, 0)
  end
  defp elementAt([head | tail], pos, current) do
    if pos == current do
      head
    else
      elementAt(tail, pos, current + 1)
    end
  end

  def myReverse(list) do
    myReverse(list, [])
  end
  defp myReverse([head | tail], newList) do
    myReverse(tail, List.flatten([head, newList]))
  end
  defp myReverse([], newList) do
    newList
  end

  def flatten(list) do
    flatten(list, [])
  end
  defp flatten([], flatList) do
    flatList
  end
  defp flatten([[head | tail] | tailOuter], newList) do
    flatten(tailOuter, newList ++ [head] ++ flatten(tail))
  end
  defp flatten([head | tail], newList) do
    flatten(tail, newList ++ [head])
  end

  def compress([head | tail]) do
    puts(head)
    puts(tail)
    compress([head | tail], head, [])
  end
  defp compress([head, tail], target, compressedList) do
    if head == target do
      compress(tail, target, compressedList)
    else
      compress(tail, head, compressedList ++ [head])
    end
  end
  defp compress([], nil, compressedList) do
    compressedList
  end
end
