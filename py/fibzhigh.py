#what's the first fib with 1000 digits?

def fibMake():
	i = 1
	n,m = 0,1
	while len(str(m)) < 1000:
		n,m = m,n+m
		i += 1
	return

print(fibMake())