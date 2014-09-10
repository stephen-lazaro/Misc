import math

def Eratosthesis(limit):
	a = [True for i in range(2, limit)]
	for i in range(2, math.ceil(math.sqrt(limit))):
		print(i)
		if a[i - 2] == True:
			for j in [i**2 + n*i for n in range(0,limit) if (i**2 + n*i) < limit]:
				try:
					a[j - 2] = False
				except IndexError:
					pass
	print(a)
	return a

def sumOf(lzBool):
	acc = 0
	for idx,val in enumerate(lzBool):
		if val == True:
			acc += (idx + 2)
	return acc

print(sumOf(Eratosthesis(2000000)))