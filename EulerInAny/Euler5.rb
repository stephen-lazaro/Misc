#Euler5.rb
#Not particularly elegant
class Euler5
	def initialize
		i = 20
		while true
			if (2...20).all? { |x| i % x == 0 }
				@answer = i
				break
			end
			i += 1
		end
	end
	def to_s
		@answer.to_s
	end
end

thizz = Euler5.new
puts thizz.to_s