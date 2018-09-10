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
    assert elementAt([1], 0) == 1
    assert elementAt([1, 2], 1) == 2
    assert elementAt([1, 2, "yea"], 2) == "yea"
  end

  test "reversing a list" do
    assert myReverse([1, 2, 3]) == [3, 2, 1]
    assert myReverse([1]) == [1]
    assert myReverse([]) == []
  end

  test "list flattening" do
    assert flatten([1, 2, 3]) == [1, 2, 3]
    assert flatten([1, 2, [3]]) == [1, 2, 3]
    assert flatten([1, 2, [3, 4]]) == [1, 2, 3, 4]
    assert flatten([1, 2, [3, 4]]) == List.flatten([1, 2, [3, 4]])
  end

  test "list compression" do
    assert compress([1,1]) == [1]
    assert compress(["a", "b", "c"]) == ["a", "b", "c"]
    assert compress(["a", "a", "c"]) == ["a", "c"]
  end
end
