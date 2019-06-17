defmodule PlusTest do
  use ExUnit.Case
  doctest Plus

  test "biggest plus is 1" do
    actual = Plus.find_biggest_plus(
      [["G", "G", "G", "G", "G", "G"],
       ["G", "B", "B", "B", "G", "B"],
       ["G", "G", "G", "G", "G", "G"],
       ["G", "G", "B", "B", "G", "B"],
       ["G", "G", "G", "G", "G", "G"]], 2, 2)

    assert actual == 1
  end

  test "biggest plus is 5" do
    actual = Plus.find_biggest_plus(
      [["G", "G", "G", "G", "G", "G"],
       ["G", "B", "B", "B", "G", "B"],
       ["G", "G", "G", "G", "G", "G"],
       ["G", "G", "B", "B", "G", "B"],
       ["G", "G", "G", "G", "G", "G"]], 2, 4)

    assert actual == 5
  end
end
