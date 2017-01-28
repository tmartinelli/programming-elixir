defmodule FizzBuzz do
  def upto(n) when n > 0, do: _upto(n, [])

  defp _upto(0, result), do: result

  defp _upto(current, result) do
    new_answer = cond do
      rem(current, 3) == 0 && rem(current, 5) == 0 ->
        "FizzBuzz"
      rem(current, 3) == 0 ->
        "Fizz"
      rem(current, 5) == 0 ->
        "Buzz"
      true ->
        current
    end
    _upto(current - 1, [ new_answer | result ])
  end
end
