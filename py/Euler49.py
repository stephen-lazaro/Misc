import itertools as it

debuga = False
debugb = False
debugmain = False

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

#This one is fucking everything up!
def explode(num):
	acc = []
	med = str(num)
	for character in med:
		acc.append(character)
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

def noReps(lz):
	if len(lz) == 0:
		return []
	return noReps([x for x in lz[1:] if x < lz[0]]) + [lz[0]] + noReps([y for y in lz[1:] if y > lz[0]])

def getAnswers():
	acc = []
	primes = Eratosthesis(75000)
	possSpace = range(1000, 10000)
	for poss in possSpace:
		if poss in primes:
			med = [poss]
			permutes = numbersOf(permutations(explode(poss)))
			for permute in permutes:
				pre = int(permute)
				if pre in primes and pre >= 1000:
					med.append(pre)
			acc.append(med)
	return [noReps(x) for x in acc]

def makeAnswer(lz):
	acc = it.filterfalse(lambda x: len(x) < 3, lz)
	acc = [x for x in map(noReps, acc)]
	return acc

if debugmain == True:
	v = numbersOf(permutations(explode(1487)))
	primes = Eratosthesis(75000)
	print(v)
	for i in v:
		print(str(i) +" : " + str(int(i) in primes))

print(makeAnswer(getAnswers()))