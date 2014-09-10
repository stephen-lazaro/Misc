#Maximum path sum 1
#The idea is just to take the max of each row, that's linear
#Then we don't have to brute force check every path
#We just construct the only possible maximum path

#!!! As it stands this doesn't work! You can only take the
# adjascent nodes duh.

#If we hit recursion problems, refactor it as an iteration
def getMaximum(triangle, acc):
	if len(triangle) == 0:
		return acc
	else:
		currentRow = triangle[0]
		bestChoice = max(currentRow)
		print(bestChoice)
		return getMaximum(triangle[1:], bestChoice+acc)

triangle = [
	[75],
	[95,64],
	[17,47,82],
	[18,35,87,10],
	[20,4,82,47,65],
	[19,1,23,75,3,34],
	[88,2,77,73,7,63,67],
	[99,65,4,28,6,16,70,92],
	[41,41,26,56,83,40,80,70,33],
	[41,48,72,33,47,32,37,16,94,29],
	[53,71,44,65,25,43,91,52,97,51,14],
	[70,11,33,28,77,73,17,78,39,68,17,57],
	[91,71,52,38,17,14,91,43,58,50,27,29,48],
	[63,66,4,68,89,53,67,30,73,16,69,87,40,31],
	[4,62,98,27,23,9,70,98,73,93,38,53,60,4,23]]

test = [
	[3],
	[7,4],
	[2,4,6],
	[8,5,9,3]]

print(getMaximum(test, 0))

print(getMaximum(triangle, 0))