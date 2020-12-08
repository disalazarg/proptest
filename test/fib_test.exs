defmodule FibTest do
  use ExUnit.Case
  use PropCheck, default_opts: [numtests: 100]
  doctest Fib

  describe "traditional tests" do
    test "validate the initial elements in the series" do
      assert Fib.fib(1) == 1
      assert Fib.fib(2) == 1
      assert Fib.fib(3) == 2
      assert Fib.fib(4) == 3
      assert Fib.fib(5) == 5
      assert Fib.fib(6) == 8
    end
  end

  defp positive_int, do: such_that(num <- non_neg_integer(), when: num > 0)

  describe "the fibonacci series" do
    property "is composed only of positive integers for n > 0" do
      forall n <- positive_int() do
        num = Fib.fib(n)

        is_integer(num) and num > 0
      end
    end

    property "works the same as the reference implementation for n in (1, 30)" do
      forall n <- integer(1, 30) do
        num = Fib.fib(n)
        ref = model_fib(n)

        num == ref
      end
    end
  end

  defp model_fib(n) do
    if n <= 2 do
      1
    else
      model_fib(n - 1) + model_fib(n - 2)
    end
  end
end
