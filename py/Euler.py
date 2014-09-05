#Euler.py

def isPythagorean(a,b,c):
	if a**2 + b**2 == c**2:
		return True
	return False

def getThousPythag():
	for a in range(1,1000):
		print(a)
		for b in range(1,1000):
			for c in range(1,1000):
				if a + b + c > 1000:
					break
				if isPythagorean(a,b,c):
					if a + b + c == 1000:
						print(str(a) + ',' + str(b) + ',' + str(c))
						return a*b*c

print(getThousPythag())
#Answer: 200,375,425
#a*b*c = 31875000