defmodule TicketSaleQueue do
  def waitingTime(queue, person_index) do
    waitingTimeHelper(queue, person_index, 0)
  end

  def waitingTimeHelper([], 0, time_spent) do
    time_spent
  end

  def waitingTimeHelper([1 | _tail], 0, time_spent) do
    waitingTimeHelper([], 0, time_spent + 1)
  end

  def waitingTimeHelper([head], 0, time_spent) do
    waitingTimeHelper([], 0, time_spent + head)
  end

  def waitingTimeHelper([head| tail], 0, time_spent) do
    updated_queue = List.flatten(tail, [(head - 1)])
    updated_person_index = Enum.count(updated_queue) - 1
    waitingTimeHelper(updated_queue, updated_person_index, time_spent + 1)
  end

  def waitingTimeHelper([1 | tail], person_index, time_spent) do
    waitingTimeHelper(tail, person_index - 1, time_spent + 1)
  end

  def waitingTimeHelper([head | tail], person_index, time_spent) do
    updated_queue = List.flatten(tail, [(head - 1)])
    updated_person_index = person_index - 1
    waitingTimeHelper(updated_queue, updated_person_index, time_spent + 1)
  end
end
