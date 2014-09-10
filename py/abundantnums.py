def abundanceSieve():
	possSpace = [True for x in range(12,28123)]
	for idx,val in enumerate(possSpace):
		if isAbundant(idx + 12):
			
