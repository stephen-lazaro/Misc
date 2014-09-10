#Number spiral
#Solved in like ten minutes.
#Pattern recognition motherfucker.

def get():
	acc = 1
	current = 1
	for dimgrid in range(3, 1002, 2):
		i = 4
		while i > 0:
			i -= 1
			current += dimgrid - 1
			print(current)
			acc += current
	return acc

print(get())