defmodule MyList do
  def all?([], _), do: true
  def all?(list = [head | _], fun), do: fun.(head) |> _all?(list, fun)
  defp _all?(true, [_ | tail], fun), do: all?(tail, fun)
  defp _all?(false, _, _), do: false

  def each([], _), do: :ok
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], _), do: []
  def filter(list = [head | _], fun), do: fun.(head) |> _filter(list, fun)
  defp _filter(true, [head | tail], fun), do: [head | filter(tail, fun)]
  defp _filter(false, [_ | tail], fun), do: filter(tail, fun)

  def take([], _), do: []
  def take(_, 0), do: []
  def take([head | tail], count), do: [head | take(tail, count - 1)]

  def split(list, count), do: _split(list, count, [])
  defp _split([], _, memo), do: {memo, []}
  defp _split(list, 0, memo), do: {memo, [list]}
  defp _split([head | tail], count, memo), do: _split(tail, count - 1, memo ++ [head])

  def flatten(list), do: _flatten(list, [])
  defp _flatten([], memo), do: Enum.reverse(memo)
  defp _flatten([ [ h | [] ] | tail ], memo), do: _flatten([h | tail], memo)
  defp _flatten([ [ h | t ] | tail ], memo), do: _flatten([h, t | tail], memo)
  defp _flatten([head | tail], memo), do: _flatten(tail, [head | memo])
end
