defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&(fizzbuzz(&1, rem(&1, 3), rem(&1, 5))))

  defp fizzbuzz(_, 0, 0), do: "FizzBuzz"
  defp fizzbuzz(_, 0, _), do: "Fizz"
  defp fizzbuzz(_, _, 0), do: "Buzz"
  defp fizzbuzz(current, _, _), do: current
end
