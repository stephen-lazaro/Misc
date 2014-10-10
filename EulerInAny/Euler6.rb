#Euler6.rb

class Euler6
	def initialize
		@sum_square, @square_sum = 0, 0
		(1..100).each {|x| @sum_square += x*x}
		(1..100).each {|x| @square_sum += x}
		@square_sum *= @square_sum
	end
	def to_s
		(@square_sum - @sum_square).to_s
	end
end

thizz = Euler6.new
puts thizz.to_s