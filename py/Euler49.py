debuga = False
debugb = False

def Eratosthesis(limit):
	numbers = [x for x in range(2, limit+1)]
	p = 2
	j = 0
	done = False
	while not done:
		for i, n in enumerate(numbers):
			if n % p == 0 and n != p:
				numbers.pop(i)
		j += 1
		p = numbers[j]
		if p**2 > n:
			done = True
	return numbers

def explode(num):
	acc = []
	med = str(num)
	for character in med:
		acc.append(med)
	return acc

def permutations(lz):
	def permute(lz):
		if len(lz) == 0:
			return []
		acc = []
		for idx,val in enumerate(lz):
			nexts = permute(lz[:idx] + lz[idx + 1:])
			for idx,item in enumerate(nexts):
				med = [val]
				try:
					med += item
				except TypeError:
					med.append(item)
				nexts[idx] = med
			if nexts == []:
				nexts = [val]
			acc = acc + nexts
		return acc
	return permute(lz)

if debuga == True:
	print(permutations([5]))
	print(permutations([5,6]))
	print(permutations([5,6,7]))
	print(permutations([8,5,6,7]))

def numbersOf(lz):
	acc = []
	for item in lz:
		med = ''
		try:
			for num in item:
				med += str(num)
		except TypeError:
			med = str(item)
		acc.append(med)
	return acc
if debugb == True:
	print(numbersOf(permutations([5])))
	print(numbersOf(permutations([5,6])))
	print(numbersOf(permutations([5,6,7])))
	print(numbersOf(permutations([8,5,6,7])))


def getAnswer():
	primes = Eratosthesis(75000)
	possSpace = range(1000, 10000)
	for poss in possSpace:
		if poss in primes:
			acc = [poss]
			permutes = numbersOf(permutations(explode(poss)))
			for permute in permutes:
				if int(permute) in primes:
					acc.append(permute)
			if len(acc) == 2:
				return acc


print(1487 in Eratosthesis(75000))