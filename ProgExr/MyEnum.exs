defmodule MyEnum do
	def all?(list, func), do: all?(list, func, true)
	defp all?([], _, true), do: true
	defp all?(_, _, false), do: false
	defp all?([head | tail], func, true), do: all?(tail, func, func.(head))

	def each([], _), do: :ok
	def each([head | tail], func) do
		func.(head)
		each(tail, func)
	end

	def filter(list, func), do: filter(list, func, [])
	defp filter([], _, result), do: result
	defp filter([head | tail], func, result) do
		if func.(head) do
			filter(tail, func, result ++ [head])
		else
			filter(tail, func, result)
		end
	end

	def take(list, count) when is_integer(count), do: take(list, count, [])
	defp take(_, count, result) when count === 0, do: result
	defp take([head | tail], count, result), do: take(tail, count-1, result ++ [head])

	def split(list, count) when is_integer(count), do: split(list, count, [])
	defp split(part2, count, part1) when count === 0, do: {part1, part2}
	defp split([head | tail], count, part1), do: split(tail, count-1, part1 ++ [head])

	def flatten(list), do: flatten(list, [])
	defp flatten([], result), do: result
	defp flatten([head | tail], result) when is_list(head) do
	 flatten(tail, result ++ flatten(head))
	end
	defp flatten([head | tail], result), do: flatten(tail, result ++ [head])
end