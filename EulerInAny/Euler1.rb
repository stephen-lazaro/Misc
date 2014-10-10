#Perfect
class Euler1
	attr_reader :answer
	def initialize()
		@answer = 0
		(1..1000).each {|x| @answer += x if x % 3 == 0 or x % 5 == 0}
	end
	def to_s()
		@answer.to_s
	end
end

answer = Euler1.new
puts answer.to_s