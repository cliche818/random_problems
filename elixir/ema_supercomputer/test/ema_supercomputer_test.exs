defmodule EmaSupercomputerTest do
  use ExUnit.Case
  doctest EmaSupercomputer

  test "the returned value should be 5" do
    actual = EmaSupercomputer.solve(
      [["G", "G", "G", "G", "G", "G"],
        ["G", "B", "B", "B", "G", "B"],
        ["G", "G", "G", "G", "G", "G"],
        ["G", "G", "B", "B", "G", "B"],
        ["G", "G", "G", "G", "G", "G"]])
    assert actual == 5
  end

  test "the returned value should be 25" do
    actual = EmaSupercomputer.solve(
      [["B", "G", "B", "B", "G", "B"],
        ["G", "G", "G", "G", "G", "G"],
        ["B", "G", "B", "B", "G", "B"],
        ["G", "G", "G", "G", "G", "G"],
        ["B", "G", "B", "B", "G", "B"],
        ["B", "G", "B", "B", "G", "B"]])
    assert actual == 25
  end
end
