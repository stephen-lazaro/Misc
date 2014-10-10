#Euler3.rb
#Bueno!!
class Euler3
	#This implementation is a little wasteful. 
	#There should be a faster way
	#It's, afterall, much slower than my python
	def eratosthenes(n)
		primes = (2...n).to_a
		primes.each { |y|
			break if y*y >= n
			(0...n).each {|x|
				t = y*y + y*x
				break if t >= n
				primes.delete(t)
			}
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