def transform(prob):
	if len(prob) == 1:
		return prob
	acc = []
	for idx,val in enumerate(prob[-2]):
		if val == 0:
			pass
		else:
			acc.append(val + max(prob[-1][idx], prob[-1][idx+1]))
	prob.pop(-2)
	prob.pop(-1)
	prob.append(acc)
	return prob

def getAnswer(problem):
	for i in range(len(problem)):
		transform(problem)
	return problem

def getProblem():
	acc = []
	with open("p067_triangle.txt", 'r') as data:
		txt = data.read()
		txt = txt.split("\n")
		for line in txt:
			temp = line.split(" ")
			med = []
			for item in temp:
				try:
					med.append(int(item))
				except ValueError:
					pass
			if med != []:
				acc.append(med)
	return acc

print(getAnswer(getProblem()))