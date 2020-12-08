defmodule Fib do
  @moduledoc """
  Documentation for `Fib`.
  """

  def fib(n), do: f(n, 0, 1)

  defp f(n, a, b)
  defp f(0, a, _b), do: a
  defp f(n, a, b), do: f(n - 1, a + b, a)
end
