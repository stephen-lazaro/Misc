import math

def makeReciprocals():
	med = 6
	for d in range(2, 1000):
		if 100 % d == 0:
			pass
		elif d % 100 == 0:
			pass
		else:
			acc = getCycle(d)
			if acc > med:
				med = acc
	return med


def getCycle(d):
	length = 0
	for i in range(1000, -1):
		if length >= i:
			break
		repz = [0 for x in range(1000)]
		val = 1
		pos = 0
		while repz[val] == 0 and val != 0:
			repz[val] = pos
			val *= 10
			val %= i
			pos += 1
		if pos - repz[val] > length:
			length = pos - repz[val]
	return length

print(getCycle(7))
#Now we need a way to recognize a repeating pattern
'''
def getCycle(recip):
	recip = str(recip)
	recip = recip[2:]
	repz = []
	for idx,val in enumerate(recip):
		if val in repz:
			break
		if val in recip[idx+1:]:
			repz.append(val)
	return len(repz)

for d in range(11,21):
	print("1/" + str(d) + " : "+ str(1/d))
	print(getCycle(1/d))
'''
print(makeReciprocals())

#PROBLEM: Pythons doubles represent too small to give
# the necessary number of digits.
# getCycles needs to be rewritten

# math.floor(10 * 1 / d)


