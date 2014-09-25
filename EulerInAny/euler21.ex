defmodule Euler21 do
	defp divisors(1) do
		[1]
	end

	defp divisors(x)  do
		for n <- 1..x-1, rem(x, n) == 0, do: n
	end

	defp div_sum(x) do
		List.foldr(divisors(x), 0, (fn(x, y) -> x + y end))
	end

	defp is_amicable?(n) do
		div_sum(div_sum(n)) == n and div_sum(n) != n
	end 

	defp possibles do
		for n <- 5..10000, is_amicable?(n), do: n 
	end

	def answer do
		List.foldr(possibles(), 0, (fn(x, y) -> x + y end))
	end
end