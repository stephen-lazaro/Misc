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