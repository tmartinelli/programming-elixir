defmodule MyString do
  def printable_ascii?([]), do: true
  def printable_ascii?([head | tail]) when head in ?\s..?~, do: printable_ascii?(tail)
  def printable_ascii?(_), do: false
end
