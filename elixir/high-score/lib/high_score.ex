defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name) do
    Map.put(scores, name, 0)
  end

  def add_player(scores, name, score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    scores
    |> Map.delete(name)
  end

  def reset_score(scores, name) do
    scores
    |> Map.put(name, 0)
  end

  def update_score(scores, name, score) do
    scores
    |> Map.update(name, score, &(&1 + score))
  end

  def get_players(scores) do
    scores
    |> Map.keys()
  end
end
