import math

def sieve(limit):
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

#This sieve is better. Instead of doing a bunch of bit flags and then
#Afterwards building the list, we start with the list and then sieve
#out all the non primes. This alone makes it faster. There's also less
#overhead on the for loops. I also think the first one was just wrong!
#It was ending too soon for some reason.

def isGoldbach(n, primes):
	for square in [x*x for x in range(1, math.floor(math.sqrt(n)))]:
		if (n - 2*square) in primes:
			return True
	return False

def getAnswer():
	primes = sieve(10000)
	for i in range(9,6000,2):
		if i in primes:
			pass
		else:
			if not isGoldbach(i, primes):
				return i

print(getAnswer())