import math

letterToValue = {'a' : 1,'b' : 2,'c' : 3,'d' : 4, 'e' : 5,
 'f' : 6, 'g' : 7, 'h' : 8, 'i' : 9, 'j' : 10,
 'k' : 11, 'l' : 12, 'm' : 13, 'n': 14, 'o' : 15,
 'p' : 16, 'q' : 17, 'r' : 18, 's' : 19, 't' : 20,
 'u' : 21, 'v' : 22, 'w' : 23, 'x' : 24, 'y' : 25,
 'z' : 26}

def makeValues(word):
	acc = []
	for char in word:
		try:
			acc.append(letterToValue[char])
		except KeyError:
			pass
	return acc

def isTriangular(num):
	work = 8 * num + 1
	rootFloor = math.floor(math.sqrt(work))
	rootCeil = math.ceil(math.sqrt(work))
	if rootFloor * rootFloor == work or rootCeil * rootCeil == work:
		return True
	return False

def getAnswer():
	with open('p042_words.txt') as source:
		count = 0
		words = source.read().split(',')
		words = [word.lower() for word in words]
		for word in words:
			if isTriangular(sum(makeValues(word))):
				count += 1
		return count

print(getAnswer())