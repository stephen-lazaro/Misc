import itertools as it

class PermutationsTest:
	def __init__(self, a, b):
		self.aset = Set(a)
		self.bset = Set(b)
		if (self.aset == self.bset and len(a) == len(b)):
			this.val = True
			return
		this.val = False

	def get(self):
		return self.val

	@staticmethod
	def isPermute(cls, a, b):
		if b in it.permutations(a):
			return True
		return False