#Triangle Counter!!
#Get me the first triangle nubmer with /five hundred divisors/

def countFactors(intg):
	a = [False for i in range(intg)]
	for idx,val in enumerate(a):
		if intg % idx == 0:
			a[idx] = True
	a