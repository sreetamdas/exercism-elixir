defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search({key}, key), do: {:ok, 0}

  def search(numbers, key) do
    list = numbers |> Tuple.to_list()
    first = 0
    last = length(list) - 1

    binary_search(numbers, key, first, last)
  end

  defp binary_search(numbers, key, first, last) do
    mid = floor((last + first) / 2)

    cond do
      key < elem(numbers, first) or key > elem(numbers, last) ->
        :not_found

      key == elem(numbers, first) ->
        {:ok, first}

      key == elem(numbers, last) ->
        {:ok, last}

      key == elem(numbers, mid) ->
        {:ok, mid}

      key < elem(numbers, mid) and mid != last ->
        binary_search(numbers, key, first, mid)

      key > elem(numbers, mid) and mid != first ->
        binary_search(numbers, key, mid, last)

      true ->
        :not_found
    end
  end
end
