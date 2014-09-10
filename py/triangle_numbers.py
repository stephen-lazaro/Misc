import math

def Eratosthesis(limit):
	a = [True for i in range(2, limit)]
	for i in range(2, math.ceil(math.sqrt(limit))):
		if a[i - 2] == True:
			for j in [i**2 + n*i for n in range(0,limit) if (i**2 + n*i) < limit]:
				try:
					a[j - 2] = False
				except IndexError:
					pass
	return a

def noReps(lz):
	if len(lz) == 0:
		return []
	pivot = lz[0]
	a = [x for x in lz[1:] if x < pivot]
	b = [y for y in lz[1:] if y > pivot]
	return noReps(a) + [pivot] + noReps(b)


#Triangle Counter!!
#Get me the first triangle number with /five hundred divisors/
#We use primes to determine the factors of the intg
#Ok! So we need to find the prime factorization of a number
def makeFactors(intg, primes):
	acc = [intg]
	for idx,val in enumerate(primes):
		if idx + 2 == intg:
			pass
		elif val == True:
			prime = idx + 2
			med = intg
			count = 0
			while med % prime == 0:
				count += 1
				if med == 1:
					break
				med //= prime
				if prime ** count != intg:
					acc.append(prime ** count)
				acc.append(med)
	return noReps(acc)

print(makeFactors((12375 * 12376 / 2), Eratosthesis(20000)))
'''
def findItem():
	testSpace = range(2, 75000)
	primes = Eratosthesis(75000)
	print("Primes up!")
	def T(thing):
		return (thing*(thing + 1)) // 2
	for item in testSpace:
		z = T(item)
		if makeFactors(z, primes) >= 500:
			return z
	return False

print(findItem())
'''