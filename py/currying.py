#Just some currying simulation in python
#Obviously, what I have written only works for two variables
#For multiple variables, a more general construction is
#necessary. This shouldn't be too hard, but does need
#some contemplation. Using *args and iterating would
#be the smart way.

def paL(f, x):
	def g(y):
		return f(x, y)
	return g

print(paL(lambda x, y: x + y, 5)(6))

def curry(f):
	def g(x):
		return paL(f, x)
	return g

print(curry(lambda x, y: x + y)(5)(6))

def paR(f, y):
	def g(x):
		return f(x, y)
	return g

print(paL(lambda x, y: x - y, 5)(6))
print(paR(lambda x, y: x - y, 5)(6))