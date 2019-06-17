defmodule Plus do
  @moduledoc """
  Documentation for Plus.
  """

  @enforce_keys [:column, :row, :size]
  defstruct [:column, :row, :size]

  @doc """
  overlap?
  ## Examples
    iex> Plus.overlap?(%Plus{column: 0, row: 0, size: 1}, %Plus{column: 1, row: 1, size: 1})
    false
    iex> Plus.overlap?(%Plus{column: 1, row: 0, size: 1}, %Plus{column: 1, row: 1, size: 5})
    true
    iex> Plus.overlap?(%Plus{column: 5, row: 1, size: 5}, %Plus{column: 5, row: 4, size: 5})
    false
    iex> Plus.overlap?(%Plus{column: 5, row: 4, size: 5}, %Plus{column: 5, row: 1, size: 5})
    false
    iex> Plus.overlap?(%Plus{column: 1, row: 3, size: 5}, %Plus{column: 4, row: 3, size: 5})
    false
    iex> Plus.overlap?(%Plus{column: 3, row: 3, size: 5}, %Plus{column: 1, row: 3, size: 5})
    true
    iex> Plus.overlap?(%Plus{column: 0, row: 0, size: 1}, %Plus{column: 0, row: 0, size: 1})
    true
  """
  def overlap?(%Plus{} = plus1, %Plus{} = plus2) do
    plus1_modifier = if (plus1.size == 1), do: 1, else: (plus1.size - 1) / 4
    plus2_modifier = if (plus2.size == 1), do: 1, else: (plus2.size - 1) / 4

    cond do
      plus1.column == plus2.column and plus1.row == plus2.row ->
        true
      plus1.size == 1 and plus2.size == 1 and plus1.column != plus2.column and plus1.row != plus2.row ->
        false
      plus1.row == plus2.row and plus1.column < plus2.column and plus1.column + plus1_modifier >= plus2.column - plus2_modifier ->
        true
      plus1.row == plus2.row and plus2.column < plus1.column and plus2.column + plus2_modifier >= plus1.column - plus1_modifier ->
        true
      plus1.column == plus2.column and plus1.row < plus2.row and plus1.row + plus1_modifier >= plus2.row - plus2_modifier ->
        true
      plus1.column == plus2.column and plus2.row < plus1.row and plus2.row + plus2_modifier >= plus1.row - plus1_modifier ->
        true
      true ->
        false
    end
  end

  @doc """
  find_biggest_plus
  ## Examples
    iex> Plus.find_biggest_plus([["B", "G", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1, 1)
    5

    iex> Plus.find_biggest_plus([["B", "B", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1, 1)
    1

    iex> Plus.find_biggest_plus([["B", "G", "B"], ["B", "G", "B"], ["B", "G", "B"]], 1, 1)
    1
  """
  def find_biggest_plus(grid, row, column) do
    vertical = find_biggest_vertical(grid, row, column)
    horizontal = find_biggest_horizontal(grid, row, column)

    cond do
      vertical == 1 ->
        1
      horizontal == 1 ->
        1
      vertical == horizontal ->
        vertical + horizontal - 1
      true ->
        min(vertical, horizontal) * 2 - 1
    end
  end

  @doc """
  find_biggest_horizontal
  ## Examples

      iex> Plus.find_biggest_horizontal([["B", "G", "B"], ["G", "B", "G"], ["B", "G", "B"]], 1, 1)
      0

      iex> Plus.find_biggest_horizontal([["B", "G", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1, 1)
      3

      iex> Plus.find_biggest_horizontal([["B", "B", "B"], ["B", "G", "G"], ["B", "B", "B"]], 1, 1)
      1

  """
  def find_biggest_horizontal(grid, row, column) do
    if value_at(grid, row, column)  == "B" do
      0
    else
      horizontal = Enum.at(grid, row)
      length(get_biggest_line(horizontal, column))
    end
  end

  @doc """
  find_biggest_vertical
  ## Examples

      iex> Plus.find_biggest_vertical([["B", "G", "B"], ["G", "B", "G"], ["B", "G", "B"]], 1, 1)
      0

      iex> Plus.find_biggest_vertical([["B", "G", "B"], ["B", "G", "B"], ["B", "G", "B"]], 1, 1)
      3

      iex> Plus.find_biggest_vertical([["B", "B", "B"], ["G", "G", "G"], ["B", "G", "B"]], 1, 1)
      1

  """
  def find_biggest_vertical(grid, row, column) do
    if value_at(grid, row, column)  == "B" do
      0
    else
      vertical = get_column(grid, column)
      length(Plus.get_biggest_line(vertical, row))
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

      iex> Plus.get_biggest_line(["G", "B", "G", "B", "G"], 2)
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
