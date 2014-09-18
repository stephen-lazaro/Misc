import itertools as it

debuga = False
debugb = False
debugc = False
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
	primes = Eratosthesis(10000)
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

def bestSelect(lz):
	acc = []
	for idx,val in enumerate(lz):
		for idy,valy in enumerate(lz[:idx] + lz[idx + 1:]):
			for idz,valz in enumerate(lz[:idy] + lz[idy + 1:]):
				if val < valy and valy < valz and valy - val == valz - valy:
					acc.append(int(str(val) + str(valy) + str(valz)))
	if len(acc) > 0:
		acc = max(acc)
	else:
		acc = 0
	return acc

if debugc == True:
	#These should all check out to 0
	print(bestSelect([1013, 1031, 1103, 1301, 3011]))
	print(bestSelect([1249, 1429, 4129, 4219, 9241, 9421]))

def makeAnswer(lz):
	acc = it.filterfalse(lambda x: len(x) < 3, lz)
	acc = [x for x in map(noReps, acc)]
	acc = [x for x in map(bestSelect, acc)]
	acc = max(acc)
	return acc

if debugmain == True:
	v = numbersOf(permutations(explode(1487)))
	primes = Eratosthesis(75000)
	print(v)
	for i in v:
		print(str(i) +" : " + str(int(i) in primes))

print(makeAnswer(getAnswers()))