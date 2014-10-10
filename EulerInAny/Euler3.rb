#Euler3.rb
#Bueno!!
class Euler3
	def eratosthenes(n)
		primes = (2...n).to_a
		primes.each { |y|
			for x in (0...n) do
				if y*y >= n
					break
				end
				primes.delete(y*y + y*x)
			end
	}
		primes
	end
	def initialize(n)
		@answer = eratosthenes(10000).keep_if {|x| n % x == 0}.max
	end
	def to_s
		@answer.to_s
	end
end

answer = Euler3.new(600_851_475_143)
puts answer.to_s