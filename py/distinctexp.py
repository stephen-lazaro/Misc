def noReps(solz):
	if len(solz) == 0:
		return []
	return noReps([a for a in solz[1:] if a < solz[0]]) + [solz[0]] + noReps([b for b in solz[1:] if b > solz[0]])

def get():
	solz = []
	for i in range(2,101):
		for j in range(2,101):
			if i**j in solz:
				print(i**j)
			else:
				solz.append(i**j)
	return len(noReps(solz))

print(get())