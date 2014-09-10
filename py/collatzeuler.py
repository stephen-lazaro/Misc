#This one is just a simple memoization exercise!
def getLongestSequence(upperLim):
	possSpace = range(2,upperLim)
	collatzd = {}
	def Collatz(start, n, acc):
		if n in collatzd:
			collatzd[start] = acc + collatzd[n]
			return collatzd[start] + 1
		elif n == 1:
			collatzd[start] = acc
			return acc
		elif n % 2 == 1:
			return Collatz(start, 3*n + 1, acc + 1)
		else:
			return Collatz(start, n // 2, acc + 1)
	acc = {}
	print(Collatz(13,13,0))
	for i in possSpace:
		acc[i] = Collatz(i, i, 0)
	return getMax(acc)

def getMax(givens):
	mz = max([givens[key] for key in givens])
	for key in givens:
		if givens[key] == mz:
			return key
	return False

print(getLongestSequence(14))
print(getLongestSequence(1000000))