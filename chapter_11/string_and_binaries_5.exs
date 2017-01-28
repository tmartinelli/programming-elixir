defmodule MyString do
  def center(list), do: list |> max_length |> centralize(list) |> print_list

  defp max_length(list), do: _max_length(list, 0)
  defp _max_length([], max), do: max
  defp _max_length([head | tail], max), do: head |> String.length |> compare_length(max, tail)
  defp compare_length(len, max, list) when len > max, do: _max_length(list, len)
  defp compare_length(_, max, list), do: _max_length(list, max)

  defp centralize(_, []), do: []
  defp centralize(max_len, [head | tail]), do: [centralize_one(head, max_len) | centralize(max_len, tail)]

  defp centralize_one(str, max_len) do
    pad = max_len - String.length(str) |> div(2)
    "#{String.duplicate(" ", pad)}#{str}#{String.duplicate(" ", pad)}"
  end

  defp print_list(list) do
    list |> Enum.each(fn(n) -> IO.puts n end)
  end
end
