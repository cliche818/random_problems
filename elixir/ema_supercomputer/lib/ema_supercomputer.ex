# Problem: https://www.hackerrank.com/challenges/two-pluses/problem

defmodule EmaSupercomputer do
  @moduledoc """
  Documentation for EmaSupercomputer.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EmaSupercomputer.solve([['G', 'G', 'G'], ['G', 'G', 'G']])
      1

  """
  def solve(grid) do
    row_numbered_list = grid
    |> Enum.with_index
    |> Enum.map(fn({list, i}) ->
      {i, list}
    end)

    # IO.inspect(row_numbered_list)

    list_of_pluses = row_numbered_list
    |> Enum.map(fn(column_data) ->
      get_biggest_plus(column_data, grid)
    end)
    |> Enum.concat

    find_biggest_product(list_of_pluses)
  end

  @doc """
  ## Examples
      iex> EmaSupercomputer.find_biggest_product([%Plus{column: 0, row: 0, size: 1},%Plus{column: 0, row: 1, size: 1}, %Plus{column: 1, row: 1, size: 1},%Plus{column: 2, row: 1, size: 1}])
      1

  """
  def find_biggest_product(list) do
    viable_list = for plus1 <- list,
                      plus2 <- list,
                      !Plus.overlap?(plus1, plus2),
                      do: {plus1, plus2}

    highest_pluses = Enum.max_by(viable_list, fn ({x,y}) -> x.size * y.size end)

    plus_one = elem(highest_pluses, 1)
    plus_two = elem(highest_pluses, 1)

    plus_one.size * plus_two.size
  end



  defp get_biggest_plus(column_data, grid) do
    # IO.inspect(column_data)
    column_list = elem(column_data, 1)
    # IO.inspect(column_list)
    list_of_pluses = column_list
    |> Enum.with_index
    |> Enum.map(fn({_, column}) ->
      row = elem(column_data, 0)
      %Plus{row: row, column: column, size: Plus.find_biggest_plus(grid, row, column)}
    end)

    list_of_pluses
  end
end
