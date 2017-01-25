defmodule MyString do
  def calculate(str) do
    {n1, op, n2} = _calculate(str, 0, nil, 0)
    op.(n1,n2)
  end

  defp _calculate([], n1, op, n2), do: {n1, op, n2}
  defp _calculate([ ?\s | tail], n1, op, n2), do: _calculate(tail, n1, op, n2)
  defp _calculate([ ?+ | tail], n1, _, n2), do: _calculate(tail, n1, &(&1+&2), n2)
  defp _calculate([ ?- | tail], n1, _, n2), do: _calculate(tail, n1, &(&1-&2), n2)
  defp _calculate([ ?* | tail], n1, _, n2), do: _calculate(tail, n1, &(&1*&2), n2)
  defp _calculate([ ?/ | tail], n1, _, n2), do: _calculate(tail, n1, &(div(&1,&2)), n2)

  defp _calculate([head | tail], n1, op, n2) when head in ?0..?9 and op != nil do
    _calculate(tail, n1, op, n2 * 10 + head - ?0)
  end

  defp _calculate([head | tail], n1, op, n2) when head in ?0..?9 do
    _calculate(tail, n1 * 10 + head - ?0, op, n2)
  end
end
