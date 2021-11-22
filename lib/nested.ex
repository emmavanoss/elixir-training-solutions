defmodule Nested do
  def square(number) do
    number * number
  end

  def square_all(numbers) do
    Enum.map(numbers, &square/1)

    # alt 1
    # Enum.map(numbers, &square(&1))

    # alt 2
    # Enum.map(numbers, fn x -> square(x) end)
  end

  # return only the even results
  def even_squares(numbers) do
    numbers
    |> Enum.filter(fn x -> rem(x, 2) === 0 end)
    |> square_all()

    # alt 1
    # Enum.reduce(numbers, [], &append_square_if_even/2)

    # alt 2
    # numbers
    # |> Enum.reduce([], &prepend_square_if_even/2)
    # |> Enum.reverse
  end

  # defp append_square_if_even(number, acc) do
  #     case rem(number, 2) do
  #       0 -> acc ++ [square(number)]
  #       _ -> acc
  #     end
  # end

  # defp prepend_square_if_even(number, acc) do
  #     case rem(number, 2) do
  #       0 -> [square(number) | acc]
  #       _ -> acc
  #     end
  # end

  # leave odds unsquared
  def square_evens(numbers) do
    Enum.map(numbers, &square_if_even/1)
  end

  defp square_if_even(number) do
    case rem(number, 2) do
      0 -> square(number)
      _ -> number
    end
  end

  # leave odds unsquared (and unlogged)
  def square_and_log_evens(numbers) do
    Enum.map(numbers, &square_and_log_if_even/1)
  end

  defp square_and_log_if_even(number) do
    case rem(number, 2) do
      0 ->
        number
        |> IO.inspect(label: "SQUARE ME")
        |> square()

      _ ->
        number
    end
  end

  # leave odds and 12 unsquared
  def square_evens_except_twelve(numbers) do
    Enum.map(numbers, &square_if_even_except_twelve/1)
  end

  defp square_if_even_except_twelve(12) do
    12
  end

  defp square_if_even_except_twelve(number) do
    square_if_even(number)
  end
end
