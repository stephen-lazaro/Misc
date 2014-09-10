#General Utilities
debug == False

def noReps(word):
	if word == []:
		return []
	hd = word[0]
	return noReps([i for i in word[1:] if i < hd]) + [hd] + noReps([j for j in word[1:] if j > hd])

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

#Class that produces factoradic numbers
class Factoradic:
	def __init__(self, n):
		factoid = []
		i = 1
		while n != 0:
			factoid.append(math.floor(n % i))
			n //= i
			i += 1
		self.data = reverse(factoid)
		self.pos = n

	def position(self):
		return self.pos

	def permutation(self, order):
		temp = [x + 1 for x in self.data]
		acc = [1]
		for x in reverse(temp[:-1]):
			for idx,j in enumerate(acc):
				if j >= x:
					acc[idx] = j + 1
			acc = [x] + acc
		while len(acc) < order:
			acc.append(1)
		return [x - 1 for x in acc]

	@classmethod
	def fromPermutation(lz):
		def getRepetitions(word):
			acc = {}
			repList = []
			for character in word:
				if character in acc:
					acc[character] += 1
					if not character in repList:
						repList.append(character)
				else:
					acc[character] = 1
			return acc, repList

		if word == "":
			return 1
		acc = 0
		uniqTerms = noReps(word)
		reps, repsList = getRepetitions(word)
		lessThanHead = [x for x in uniqTerms if x < word[0]]
		fullPrevTree = factorial(len(word) - 1)
		for character in lessThanHead:
			med = fullPrevTree
			for rep in repsList:
				if rep != character:
					med //= factorial(reps[rep])
				else:
					med //= factorial(reps[character] - 1)
			acc += med
		return acc + count(word[1:])

	def __str__(self):
		return self.data.__str__()

#Class that produces combinadic numbers!
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