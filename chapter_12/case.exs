defmodule MyFile do
  def open(path) do
    case File.open(path) do
      { :ok, file } ->
        IO.puts("First line: #{IO.read(file, :line)}")
      { :error, reason } ->
        IO.puts("Failed to open file: #{reason}")
    end
  end
end
