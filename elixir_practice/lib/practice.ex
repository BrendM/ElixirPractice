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
    compress([head | tail], head, [head])
  end
  defp compress([head | tail], target, compressedList) do
    if head == target do
      compress(tail, target, compressedList)
    else
      compress(tail, head, compressedList ++ [head])
    end
  end
  defp compress([], _, compressedList) do
    compressedList
  end

  def pack([head | tail]) do
    pack(tail, head, [head], [])
  end
  def pack([]) do
    []
  end
  defp pack([head | tail], target, sub_pack, packed_list)do
    if head == target do
      pack(tail, head, sub_pack ++ [head], packed_list)
    else
      pack(tail, head, [head], packed_list ++ [sub_pack])
    end
  end
  defp pack([], _, sub_pack, packed_list)do
    packed_list ++ [sub_pack]
  end
end
