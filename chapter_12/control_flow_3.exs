defmodule MyAssert do
  def ok!({:ok, data}), do: data
  def ok!({error_type, error_message}), do: raise("#{error_type}: #{error_message}")
end
