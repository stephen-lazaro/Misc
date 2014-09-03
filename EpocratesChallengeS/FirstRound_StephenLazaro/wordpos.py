import sys

### More or Less Pure Code Here ###

# Quicksort, just a way to sort the word and remove repeats.
def noReps(word):
	if word == []:
		return []
	hd = word[0]
	return noReps([i for i in word[1:] if i < hd]) + [hd] + noReps([j for j in word[1:] if j > hd])

# Since the largest factorial we'll possibly have to compute is ~26! this should be plenty fast
# though admittedly there are faster factorials.
def factorial(n):
	if n==0:
		return 1
	return n*factorial(n - 1)

# This builds a dictionary that looks up occurrence rate by letter in the word
# and a list of repeated terms.
def getRepetitions(word):
	acc = {}
	repList = []
	for character in word:
		if character in acc:
			acc[character] += 1
			if not character in repList:
				repList.append(character)
		else:
			acc[character] = 1
	return acc, repList

# First, we just count, for each letter less than the head of the word,
# the number of permutations with repetitions we have supposing a word
# to start with that letter, e.g. for quine we have 4! words
# starting in e, and hence 3 * 4! starting in letters before q.
# To account for words with repetitions we divide off by the
# number of repetitions for each character.
# Since each of these trees is complete, this is simple combinatorics.
# The base case just accounts for the word itself in the list.
def count(word):
	if word == "":
		return 1
	acc = 0
	uniqTerms = noReps(word)
	reps, repsList = getRepetitions(word)
	lessThanHead = [x for x in uniqTerms if x < word[0]]
	fullPrevTree = factorial(len(word) - 1)
	for character in lessThanHead:
		med = fullPrevTree
		for rep in repsList:
			if rep != character:
				med //= factorial(reps[rep])
			else:
				med //= factorial(reps[character] - 1)
		acc += med
	return acc + count(word[1:])

### Command Line Interfacing Stuff Here ###
# This just grabs the command line argument.
def getArgument():
	try:
		return sys.argv[1]
	except IndexError:
		return -1

# Check that we were given an argument, then proceed accordingly.
def main():
	arg = getArgument()
	if arg == -1:
		print("You have to give an argument.")
	else:
		print(count(arg))

main()