defmodule Plus do
  @moduledoc """
  Documentation for Plus.
  """

  @doc """
  find_biggest_vertical
  ## Examples

      iex> Plus.find_biggest_vertical([["B", "G", "B"], ["G", "B", "G"], ["B", "G", "B"]], 1, 1)
      0

      iex> Plus.find_biggest_vertical([["B", "G", "B"], ["G", "B", "G"], ["B", "G", "B"]], 1, 1)
      0

      iex> Plus.find_biggest_vertical([["B", "G", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1, 1)
      3

      iex> Plus.find_biggest_vertical([["B", "B", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1, 1)
      1

  """
  def find_biggest_vertical(grid, row, column) do
    if value_at(grid, row, column)  == "B" do
      0
    else
      vertical = get_column(grid, column)
      length(get_biggest_line(vertical, row))
    end
  end

  @doc """
  get_column
  ## Examples

      iex> Plus.get_column([["B", "G", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1)
      ["G","G","G"]

      iex> Plus.get_column([["B", "G", "B"], ["B", "G", "B"], ["B", "G", "B"]], 0)
      ["B", "B", "B"]
  """
  def get_column(grid, column) do
    transposed_matrix = for t <- Enum.zip(grid), do: Tuple.to_list(t)

    Enum.at(transposed_matrix, column)
  end

  @doc """
  get_biggest_line
  ## Examples
      iex> Plus.get_biggest_line(["B", "G", "B"], 1)
      ["G"]

      iex> Plus.get_biggest_line(["G", "G", "G"], 1)
      ["G","G","G"]

      iex> Plus.get_biggest_line(["G", "G", "G"], 0)
      ["G"]
  """

  def get_biggest_line(list, starting_point) do
    get_biggest_line_helper(list, starting_point, 0)
  end

  defp get_biggest_line_helper(list, starting_point, line_size) do
    first_index = starting_point - line_size - 1
    last_index = starting_point + line_size + 1

    cond do
      Enum.member?(Enum.slice(list, first_index..last_index), "B") ->
        Enum.slice(list, first_index + 1..last_index - 1)
      first_index < 0 ->
        Enum.slice(list, first_index + 1..last_index - 1)
      last_index >= length(list) ->
        Enum.slice(list, first_index + 1..last_index - 1)
      true ->
        get_biggest_line_helper(list, starting_point, line_size + 1)
    end
  end

  @doc """
  value_at
  value_at
  ## Examples
      iex> Plus.value_at([["B", "G", "B"], ["G", "B", "G"], ["B", "G", "B"]], 1, 1)
      "B"

      iex> Plus.value_at([["B", "G", "B"], ["G", "B", "G"], ["B", "G", "B"]], 1, 0)
      "G"
  """
  def value_at(grid, row, column) do
    Enum.at(Enum.at(grid, row), column)
  end
end
