defmodule ElixirPracticeTest do
  use ExUnit.Case
  doctest ElixirPractice

  test "last element of a list" do
    assert Practice.last([1]) == 1
    assert Practice.last([1, 2, 3]) == 3
    assert Practice.last(["hey", 2, "ya"]) == "ya"
  end

  test "get elements at a position in a list" do
    assert Practice.elementAt([1], 0) == 1
    assert Practice.elementAt([1, 2], 1) == 2
    assert Practice.elementAt([1, 2, "yea"], 2) == "yea"
  end

  test "reversing a list" do
    assert Practice.myReverse([1,2,3]) == [3,2,1]
    assert Practice.myReverse([1]) == [1]
    assert Practice.myReverse([]) == []
  end
end
