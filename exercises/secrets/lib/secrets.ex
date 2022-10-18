defmodule Secrets do
  use Bitwise

  def secret_add(secret) do
    fn x -> x + secret end
  end

  def secret_subtract(secret) do
    fn x -> x - secret end
  end

  def secret_multiply(secret) do
    fn x -> x * secret end
  end

  def secret_divide(secret) do
    fn x -> div(x, secret) end
  end

  def secret_and(secret) do
    fn x -> band(x, secret) end
  end

  def secret_xor(secret) do
    fn x -> bxor(x, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn x ->
      x
      |> secret_function1.()
      |> secret_function2.()
    end
  end
end
