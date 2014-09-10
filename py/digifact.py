def factorial(n):
	if n == 0:
		return 1
	else:
		return n * factorial(n - 1)

def isDigitFactorial(intg):
	acc = 0
	work = str(intg)
	for charact in work:
		acc += factorial(int(charact))
	if acc == intg:
		return True
	return False

def get():
	acc = []
	for i in range(10, 1000001):
		if isDigitFactorial(i):
			acc.append(i)
	return sum(acc)

print(get())