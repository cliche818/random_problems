defmodule TicketSaleQueueTest do
  use ExUnit.Case, async: true

  test "the time should be 0 for empty queue" do
    assert TicketSaleQueue.waitingTime([], 0) == 0
  end

  test "the time should be 1 for [1]" do
    assert TicketSaleQueue.waitingTime([1], 0) == 1
  end

  test "the time should be 5 for [5]" do
    assert TicketSaleQueue.waitingTime([5], 0) == 5
  end

  test "the time should be 2 for [1,1] if tracking person at index 1 initially" do
    assert TicketSaleQueue.waitingTime([1,1], 1) == 2
  end

  test "the time should be 3 for [1, 1, 1] if tracking person at index 2 initially" do
    assert TicketSaleQueue.waitingTime([1,1,1], 2) == 3
  end

  test "the time should be 4 for [1, 2, 5] if tracking person at index 1 initially" do
    assert TicketSaleQueue.waitingTime([1,2,5], 1) == 4
  end

  test "the time should be 11 for [5,5,2,3] if tracking person at index 3 initially" do
    assert TicketSaleQueue.waitingTime([5,5,2,3], 3) == 11
  end
end
