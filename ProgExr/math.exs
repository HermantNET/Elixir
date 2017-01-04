defmodule Math do
	def sum(1), do: 1
	def sum(n) when n > 1, do: n + sum(n - 1)

	def gcd(x,0), do: x
	def gcd(x,y), do: gcd(y, rem(x,y))

	def add(a \\ 2, b, c \\ 4), do: a + b + c

	def divByRem(a, b \\ 2)
	def divByRem(a, b) when a > b, do: a / rem(a,b)
	def divByRem(a, b), do: "#{a} smaller than #{b}"

	def cats do
		3 |> sum |> gcd(3)
	end

	def prime(n), do: for num <- Enum.into(2..n, []), is_prime(num), do: num

	def is_prime(n), do: is_prime(2..n, true)
	defp is_prime(_.._, prime) when prime === false, do: false
	defp is_prime(i..n, _) when i > div(n, 2), do: true
	defp is_prime(i..n, _) do
		if rem(n, i) === 0 do
			is_prime((i+1)..n, false)
		else
			is_prime((i+1)..n, true)
		end
	end 
end