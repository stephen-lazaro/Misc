#Name Scoring


def getScore(idx, item):
	score = 0
	for charact in item:
		score += ordinal(charact)
	return idx * score

def ordinal(charact):
	charact = charact.lower()
	val = ord(charact) - 96
	return val

print(getScore(938, 'colin'))

def sort(lz):
	if len(lz) == 0:
		return []
	pivot = lz[0]
	a = [x for x in lz[1:] if x < pivot]
	b = [x for x in lz[1:] if x >= pivot]
	return sort(a) + [pivot] + sort(b)

def calc():
	with open("names.txt") as names:
		thing = names.read()
		lz = thing.split(',')
		lz = sort(lz)
		print(lz[937])
		sz = 0
		for idx,item in enumerate(lz):
			med = getScore(idx + 1, item[1:-1])
			sz += med
		return sz

print(calc())
