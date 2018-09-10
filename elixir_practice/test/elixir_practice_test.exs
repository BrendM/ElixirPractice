defmodule ElixirPracticeTest do
  use ExUnit.Case
  import Practice
  doctest ElixirPractice

  test "last element of a list" do
    assert last([1]) == 1
    assert last([1, 2, 3]) == 3
    assert last(["hey", 2, "ya"]) == "ya"
  end

  test "get elements at a position in a list" do
    assert element_at([1], 0) == 1
    assert element_at([1, 2], 1) == 2
    assert element_at([1, 2, "yea"], 2) == "yea"
  end

  test "reversing a list" do
    assert my_reverse([1, 2, 3]) == [3, 2, 1]
    assert my_reverse([1]) == [1]
    assert my_reverse([]) == []
  end

  test "list flattening" do
    assert flatten([1, 2, 3]) == [1, 2, 3]
    assert flatten([1, 2, [3]]) == [1, 2, 3]
    assert flatten([1, 2, [3, 4]]) == [1, 2, 3, 4]
    assert flatten([1, 2, [3, 4]]) == List.flatten([1, 2, [3, 4]])
  end

  test "list compression" do
    assert compress([1, 1]) == [1]
    assert compress(["a", "b", "c"]) == ["a", "b", "c"]
    assert compress(["a", "a", "c"]) == ["a", "c"]
  end

  test "list packing" do
    assert pack([1, 2, 2]) == [[1], [2, 2]]
    assert pack([]) == []
    assert pack([1, 1, 1, 1]) == [[1, 1, 1, 1]]
  end

  test "run=length encoding" do
    assert encode([1, 2, 2]) == [{1, 1}, {2, 2}]
    assert encode(["a", "b", "b"]) == [{1, "a"}, {2, "b"}]
  end

  test "run-lenght decode" do
    assert decode([{1, 1}, {2, 2}]) == [1, 2, 2]
    assert decode(encode([1, 2, 2])) == [1, 2, 2]
    assert decode([{5, "a"}, {2, 2}]) == ["a", "a", "a", "a", "a", 2, 2]
    assert decode(encode(["a", "a", "a", "a", "a", 2, 2])) == ["a", "a", "a", "a", "a", 2, 2]
  end

  test "slice a list" do
    assert slice([1, 2, 3], 1, 2) == [2, 3]
    assert slice([1, 2, 3, 4, 5], 0, 4) == [1, 2, 3, 4, 5]
  end
end
