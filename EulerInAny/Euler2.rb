#Euler2.rb
class Euler2
	def is_square(n)
		$temp = Math.sqrt(n).floor
		$temp2 = Math.sqrt(n).ceil
		if $temp * $temp == n or $temp2 * $temp2 == n
			true
		else
			false
		end
	end
	def initialize()
		@answer = 0
		(1...4_000_000).each {|x| @answer += x if x % 2 == 0 && is_square(5*x*x + 4) or is_square(5*x*x - 4) }
	end
	def to_s()
		@answer.to_s
	end
end

answer = Euler2.new
puts answer.to_s