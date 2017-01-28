defmodule User do
  def information_about(user) do
    case user do
      %{ state: state } = person ->
        IO.puts("#{person.name} lives in #{state}")
      _ ->
        IO.puts("No matches")
    end
  end
end
