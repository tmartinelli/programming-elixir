defmodule MyList do
  def flatten(list), do: _flatten(list, [])
  defp _flatten([], memo), do: Enum.reverse(memo)
  defp _flatten([ [ h | [] ] | tail ], memo), do: _flatten([h | tail], memo)
  defp _flatten([ [ h | t ] | tail ], memo), do: _flatten([h, t | tail], memo)
  defp _flatten([head | tail], memo), do: _flatten(tail, [head | memo])
end
