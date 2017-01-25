defmodule MyString do
  def anagram?(word1, word2), do: length(word1) == length(word2) && word1 -- word2 |> length == 0
end
