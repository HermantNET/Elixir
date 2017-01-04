defmodule Strings do
	def printable?(list), do: Enum.all?(list, &(&1 in 32..126))

	def anagram?(list1, list2), do: Enum.sort(list1) === Enum.sort(list2)

	def list_math(list) do
		with {list1, [operator | list2]} <- Enum.split_while(list, &(&1 in 48..57)),
				 num1 <- ascii_list_to_val(list1),
				 num2 <- ascii_list_to_val(list2),
				 do: (case operator do
					?+ ->
						num1 + num2
					?- ->
						num1 - num2
					?* ->
						num1 * num2
					?/ ->
						num1 / num2
				end)
	end

	defp ascii_list_to_val(list), do: Enum.reduce(list, 0, fn(n, acc) -> n - 48 + acc * 10 end)

	def center(list) do
	 with padding <- String.length(Enum.max_by(list, &String.length(&1))),
	 do: Enum.map(list, &(IO.puts String.pad_leading(&1, String.length(&1) + div((padding - String.length(&1)), 2) )))
	end
end

