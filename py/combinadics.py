
def factorial(a):
	if a == 0:
		return 1
	else:
		return a * factorial(a - 1)

def choose(a, b):
	if b > a:
		return 0
	elif b == a:
		return 1
	else:
		return factorial(a) // factorial(b) // factorial(a - b)

class Combinad:
	def __init__(self, intg, order):
		acc = []
		while order >= 0:
			i = 1
			while True:
				if choose(i, order) > intg:
					rez = choose(i - 1, order)
					order -= 1
					intg -= rez
					acc.append(i - 1)
					break
				i += 1
		self.data = acc
		self.decimal = intg

	@classmethod
	def fromCombinations(lz, order):
		return Combinad(sum(lz), order)

	def position(self):
		return self.decimal

	def __str__(self):
		return self.data.__str__()

if debug == True:
	print(choose(8, 5))
	print(choose(6, 4))
	print(choose(3, 3))
	print(Combinad(72, 5))