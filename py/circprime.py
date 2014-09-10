import math
#There is a much, much smarter way to do this
#You could think about the permutations;
#Once we know one cycle is cyclic, we would
#Want to count then disregard all of them

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

def isCircular(prime, primez):
	work = str(prime)
	med = work[1:] + work[0]
	count = len(work)
	while count >= 0:
		if not primez[int(med) - 2]:
			return False
		if work == med:
			break
		med = med[1:] + med[0]
	return True

def get():
	acc = 0
	primez = Eratosthesis(1000000)
	for idx,prime in enumerate(primez):
		if prime == True:
			if isCircular(idx + 2, primez):
				acc += 1
	return acc

primz = Eratosthesis(1500)
print(isCircular(197, primz))
print(isCircular(2, primz))
print(isCircular(13, primz))
print(isCircular(71, primz))
print(get())