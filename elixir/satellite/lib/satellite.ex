defmodule Satellite do
  @typedoc """
  A tree, which can be empty, or made from a left branch, a node and a right branch
  """
  @type tree :: {} | {tree, any, tree}

  @doc """
  Build a tree from the elements given in a pre-order and in-order style
  """
  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}

  def build_tree(preorder, inorder) do
    cond do
      not has_unique(preorder) or not has_unique(inorder) ->
        {:error, "traversals must contain unique items"}

      not has_different_lengths(preorder, inorder) ->
        {:error, "traversals must have the same length"}

      not has_same_elements(preorder, inorder) ->
        {:error, "traversals must have the same elements"}

      true ->
        {:ok, build(preorder, inorder)}
    end
  end

  defp build([], []), do: {}

  defp build([root | rest_preorder], inorder) do
    {left_inorder, [^root | right_inorder]} =
      inorder
      |> Enum.split_while(&(&1 !== root))

    {left_preorder, right_preorder} =
      rest_preorder
      |> Enum.split(Enum.count(left_inorder))

    {build(left_preorder, left_inorder), root, build(right_preorder, right_inorder)}
  end

  defp has_unique(tree) do
    tree
    |> Enum.uniq()
    |> then(&(tree === &1))
  end

  defp has_same_elements(preorder, inorder),
    do: Enum.frequencies(preorder) === Enum.frequencies(inorder)

  defp has_different_lengths(preorder, inorder), do: length(preorder) === length(inorder)
end
