defmodule HighScore do
  def new(), do: %{}
  
  def add_player(scores, name, score \\ 0)
   
  def add_player(scores, name, score) do
    Map.put(scores, name, score)     
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    HighScore.add_player(scores, name)
  end

  def update_score(scores, name, score) when scores == %{} do 
    HighScore.add_player(scores, name, score)
  end 
  def update_score(scores, name, score) do
    #HighScore.add_player(scores, name, score)
    %{name => scores[name] + score}  
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
