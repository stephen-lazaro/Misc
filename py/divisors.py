#We produce the positive divisors of a number given a list of primes
import math

def noReps(lz):
	if len(lz) == 0:
		return []
	return noReps([x for x in lz[1:] if x < lz[0]]) + [lz[0]] + noReps([x for x in lz[1:] if x > lz[0]])

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

#Takes a sieved list of numbers for primes
#Must include integer
#Returns a list of positive proper divisors
def divisorz(intg, primes):
	acc = [1]
	for i in range(intg):
		if i + 2 == intg:
			pass
		elif primes[i] == True:
			prime = i + 2
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

def isAbundant(intg, primes):
	if sum(divisorz(intg, primes)) > intg:
		return True
	return False

primz = Eratosthesis(301)
for i in range(1,300):
	if isAbundant(i, primz):
		print(str(i) + " : " + str(divisorz(i, primz)))

def getNonAbundant():
	abunds = []
	primz = Eratosthesis(30000)
	for i in range(12,28124):
		if i in abunds:
			pass
		elif isAbundant(i, primz):
			j = i
			while j < 28124:
				abunds.append(j)
				j = i + j
	acc = [True for x in range(1, 28124)]
	for j in abunds:
		for i in [x for x in abunds if x >= j]:
			if i + j <= 28123:
				acc[i + j - 1] = False
			else:
				break
	return sumNonAbundant(acc)

def sumNonAbundant(nonabunds):
	acc = 0
	for idx,nonabund in enumerate(nonabunds):
		if nonabund == True:
			acc += (idx + 1)
	return acc

print(getNonAbundant())