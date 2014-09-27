import itertools as it

debug = True

class PermutationsTest:
	def __init__(self, a, b):
		self.aset = set(a)
		self.bset = set(b)
		if (self.aset == self.bset and len(a) == len(b)):
			self.val = True
			return
		self.val = False

	def get(self):
		return self.val

	@staticmethod
	def isPermute(a, b):
		if tuple(b) in it.permutations(a):
			return True
		return False

if debug == True:
	woo = PermutationsTest("abcd", "dcba")
	print(woo.get())
	woo2 = PermutationsTest("abcd", "defg")
	print(woo2.get())
	print(PermutationsTest.isPermute("abcd", "dcba"))
	print(PermutationsTest.isPermute("abcd", "defg"))