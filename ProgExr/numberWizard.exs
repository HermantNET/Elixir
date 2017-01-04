defmodule NumberWizard do
	def guess(actual, r1..r2), do: guess(actual, r1..r2, div(r2, 2))
	defp guess(actual, range, answer) do
		IO.puts "Is it #{answer}"
		calc(actual, range, answer)
	end
	defp calc(actual, _, answer) when actual === answer, do: answer
	defp calc(actual, _..r2, answer) when actual > answer do
		guess(actual, (answer+1)..r2, div(r2 + answer+1, 2))
	end
	defp calc(actual, r1.._, answer) when actual < answer do
		guess(actual, r1..(answer-1), div(answer-1 + r1, 2))
	end
end