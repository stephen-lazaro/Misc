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

def isTruncatable(prime, primez):
	work = str(prime)
	if '1' == work[-1] or '1' == work[0]:
		return False
	if primez[prime - 2] == False:
		return False
	for i in range(1,len(work)):
		if primez[int(work[i:]) - 2] == False:
			return False
		if primez[int(work[:-i]) - 2] == False:
			return False
	return True

def get():
	acc = []
	primez = Eratosthesis(1000000)
	for idx,val in enumerate(primez):
		if val == True and idx + 2 > 11:
			if isTruncatable(idx + 2, primez):
				acc = [idx + 2] + acc
	return acc

primz = Eratosthesis(10000)
print(isTruncatable(3797, primz))
print(isTruncatable(45, primz))
print(isTruncatable(13, primz))
print(get())