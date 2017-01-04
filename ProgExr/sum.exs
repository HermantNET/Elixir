defmodule Funcs do
	def sum([ head | [] ]), do: head
	def sum([ head | tail ]), do: head + sum(tail)

	def mapsum(list, func), do: mapsum(list, func, 0)
	defp mapsum([], _func, total), do: total
	defp mapsum([head | tail], func, total), do: mapsum(tail, func, total + func.(head))

	def max([head | tail]), do: maxList([head | tail], head)
	defp maxList([], greatest), do: greatest
	defp maxList([head | tail], greatest) when head > greatest do
		maxList(tail, head)
	end
	defp maxList([_head | tail], greatest), do: maxList(tail, greatest)

	def caesar(string, n), do: caesar(string, n, [])
	defp caesar([], _, result), do: result
	defp caesar([head | tail], n, result), do: caesar(tail, n, result ++ [alphabetWrap(head + n)])

	defp alphabetWrap(n) when n > 122, do: n - 122 + 97 - 1
	defp alphabetWrap(n), do: n

	def span(from, to), do: span(from, to, [])
	defp span(from, to, list) when from < to, do: span(from+1, to, list ++ [from])
	defp span(from, to, list) when from === to, do: list ++ [to]
end