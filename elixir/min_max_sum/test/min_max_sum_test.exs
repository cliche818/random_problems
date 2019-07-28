defmodule MinMaxSumTest do
  use ExUnit.Case
  doctest MinMaxSum

  test "returns a list of min and max sum" do
    actual = MinMaxSum.min_max([1,2,3,4,5])
    assert actual == [10, 14]
  end

  test "returns a list of min and max sum with bigger numbers" do
    actual = MinMaxSum.min_max([7,69,2,221,8974])
    assert actual == [299, 9271]
  end
end
