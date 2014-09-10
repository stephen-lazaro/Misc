def occurrence(item, lz):
	acc = 0
	for thing in lz:
		if item == thing:
			acc += 1
	return acc

print("20 = " + str(occurrence("d", "dddddddddddddddddddd")))
print("4 = " + str(occurrence("d", ['d','d','r','d','d'])))



class Factorial():
	def __init__(self):
		self.acc = {0:1,1:1,2:2}
	def factorialus(self, n):
		def factus(start, n, thing):
			if n in self.acc:
				self.acc[start] = thing + self.acc[n]
				return self.acc[start]
			else:
				return factus(start, n-1, n*thing)
		return factus(n, n, 1)

	def combination(self, n, m):
		return (self.factorialus(n) // self.factorialus(m)) // self.factorialus(n-m)


def getPathCount(poss, dimr):
	big = dimr
	pathz = 1
	for i in range(big + 1):
		pathz *= (2 * big) - i
		big //= i + 1
	return pathz

print(getPathCount([], 20))

#Better. How do we solve the simplest path problem? Can we sort of
#Compose these to get the right answer?