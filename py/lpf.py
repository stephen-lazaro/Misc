import math

def Eratosthesis(intg):
	acc = [True for x in range(2, intg + 1)]
	for idx in range(2, math.ceil(math.sqrt(intg))):
		if acc[idx - 2] == True:
			for j in [idx**2 + n*idx for n in range(intg) if idx**2 +n*idx < intg]:
				try:
					acc[j - 2] = False
				except IndexError:
					pass
	return acc

def primeFactors(intg, primesList):
	acc = []
	for idx,val in enumerate(primesList):
		if val == True:
			if intg % (idx + 2) == 0:
				acc.append(idx+2)
	return acc


bigFuckinL = Eratosthesis(math.floor(math.sqrt(640000000)))
print(max(primeFactors(600851475143, bigFuckinL)))