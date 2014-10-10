#Euler4.rb

class Euler4
	def is_palindrome(n)
		digits = n.to_s.split("")
		digits == digits.reverse
	end
	def initialize
		@answer = []
		(100..999).each {|x| 
			(x..999).each {|y|
				test = x*y
				@answer.push(test) if is_palindrome(test)
			}
		}
		@answer = @answer.max
	end
	def to_s
		@answer.to_s
	end
end

thing = Euler4.new
puts thing.to_s