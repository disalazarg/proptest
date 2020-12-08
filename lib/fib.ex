defmodule Fib do
  @moduledoc """
  Documentation for `Fib`.
  """

  @seed {0, 1}

  def stream do
    @seed
    |> Stream.iterate(fn {a, b} -> {a + b, a} end)
    |> Stream.map(fn {a, _b} -> a end)
  end

  def fib(n) do
    stream()
    |> Enum.at(n)
  end
end
