def isFifthSum(intg):
	work = str(intg)
	acc = 0
	for charact in work:
		acc += int(charact) ** 5
	if acc == intg:
		return True
	return False

def isFourthSum(intg):
	work = str(intg)
	acc = 0
	for charact in work:
		acc += int(charact) ** 4
	if acc == intg:
		return True
	return False

#Since the latter works reason suggests the former should as well.

def get():
	acc = []
	for i in range(2, 500000):
		if isFifthSum(i):
			acc.append(i)
	return sum(acc)

print(get())