#lexicographic order
import math

def factorial(n):
	if n == 0:
		return 1
	else:
		return n*factorial(n-1)

def reverse(lz):
	acc = []
	for i in lz:
		acc = [i] + acc
	return acc

def factoradic(n):
	factoid = []
	i = 1
	while n != 0:
		factoid.append(math.floor(n % i))
		n //= i
		i += 1
	return reverse(factoid)

def permutation(k, factorad):
	temp = [x + 1 for x in factorad]
	acc = [1]
	for x in reverse(temp[:-1]):
		for idx,j in enumerate(acc):
			if j >= x:
				acc[idx] = j + 1
		acc = [x] + acc
	return [x - 1 for x in acc]


print(permutation(10, factoradic(999999)))