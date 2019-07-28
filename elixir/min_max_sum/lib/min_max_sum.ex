defmodule MinMaxSum do
  def min_max(list) do
    min_num = Enum.min(list)
    max_num = Enum.max(list)
    sum = Enum.sum(list)

    [sum - max_num, sum - min_num]
  end
end
