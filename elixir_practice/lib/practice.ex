defmodule Practice do
  import IO, only: [puts: 1]
  @moduledoc false

  def last(list) do
    Enum.at(list, length(list) - 1)
  end

  def element_at(list, pos) do
    element_at(list, pos, 0)
  end
  defp element_at([head | tail], pos, current) do
    if pos == current do
      head
    else
      element_at(tail, pos, current + 1)
    end
  end

  def my_reverse(list) do
    my_reverse(list, [])
  end
  defp my_reverse([head | tail], newList) do
    my_reverse(tail, List.flatten([head, newList]))
  end
  defp my_reverse([], newList) do
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

  def encode(list) do
    encode(pack(list), [])
  end
  defp encode([head | tail], encoded_list)do
    encode(tail, encoded_list ++ [{length(head), List.last(head)}])
  end
  defp encode([], encoded_list) do
    encoded_list
  end

  def decode(list) do
    decode(list, [])
  end
  def decode([], decode_arr) do
    decode_arr
  end
  def decode([{num, type} | tail], decode_arr) do
    decode(tail, decode_arr ++ decode_run(type, [], num))
  end

  def decode_run(type, decode_arr, cur_num) do
    if cur_num == 0 do
      decode_arr
    else
      decode_run(type, [type | decode_arr], cur_num - 1)
    end
  end

  def slice(list, start_indx, end_indx) do
    slice(list, start_indx, end_indx, [])
  end
  defp slice(list, current_indx, end_indx, sub_list) do
    cond do
      current_indx == end_indx -> sub_list ++ [element_at(list, current_indx)]
      current_indx < end_indx -> slice(list, current_indx + 1, end_indx, sub_list ++ [element_at(list, current_indx)])
    end
  end
end
