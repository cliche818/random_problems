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

    # IO.inspect(list_of_pluses)

    1
  end

  @doc """

  """
  def find_biggest_product(list) do

  end

  defp get_biggest_plus(column_data, grid) do
    # IO.inspect(column_data)
    column_list = elem(column_data, 1)
    # IO.inspect(column_list)
    list_of_pluses = column_list
    |> Enum.with_index
    |> Enum.map(fn({_, column}) ->
      row = elem(column_data, 0)
      %{row: row, column: column, size: Plus.find_biggest_plus(grid, row, column)}
    end)

    list_of_pluses
  end


end
