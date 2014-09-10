def factorial(n):
	if n == 0:
		return 1
	else:
		return n*factorial(n-1)

def sumz(intg):
	lz = str(intg)
	acc = 0
	for digit in lz:
		acc += int(digit)
	return acc

print(sumz(factorial(100)))
