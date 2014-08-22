alpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

class CallNumber():
  @classmethod
  def tokenizeLC(cn_string):
    tags = cn_string.split(' ')
    for tag in tags:
      return

  #Eventually we'll support directly converting strings into CallNumbers
  #For now, takes a list of tokens and makes a CallNumber
  def __init__(self, cn):
    if cn is str:
      self.tokens = CallNumber.tokenizeLC(cn_string)
    elif isinstance(cn, list):
      self.tokens = cn

  #Tests to make sure every token is is greater, so call number is less
  def __lt__(self, other):
    if self == other:
      return False
    for i in range(len(self.tokens)):
      try:
        if self.tokens[i] < other.tokens[i]:
          return True
        return False
      except IndexError:
        return True #Only happens if every token in self is same as every token in other but self has more. So other is earlier.

  #Just the, uh, dual I guess, to the previous.
  def __gt__(self, other):
    if self == other:
      return False
    for i in range(len(self.tokens)):
      try:
        if self.tokens[i] > other.tokens[i]:
          return True
        return False
      except IndexError:
        return False #Only happens if every token in self is same as every token in other but self has more. So other is earlier.

  #If the underlying list is the same...
  def __eq__(self, other):
    return self.tokens == other.tokens
  #... or not the same, then respond properly.
  def __ne__(self, other):
    return self.tokens != other.tokens

  def __ge__(self, other):
    return self == other or self > other

  def __le__(self, other):
    return self == other or self < other

def test():
  cna = CallNumber(["PN", 1956, "A", 3302])
  cnb = CallNumber(["B", 3012, "F", 45])
  print(cna > cnb)  #Should be True (If I remember right)
  print(cna < cnb)  #Should be False
  print(cna == cnb) #Should be False
  print(cna != cnb) #Should be True

test()

def quicksort(lz):
  if lz == []:
    return []
  hd = lz[0]
  a = quicksort([a for a in lz if a < hd])
  b = quicksort([b for b in lz if b >= hd])
  return a + [hd] + b

class CallNumberSheet():
  #This will be a classmethod that returns a CallNumberSheet given a well formatted file of searches.
  @classmethod
  def fromFile(Filez):
    pass

  #Puts anything that really is a CallNumber type into a list
  def __init__(self, *args):
    self.callnumbers = [potent for potent in args if type(potent) is CallNumber]

  #Just lets us index the CallNumberSheet data, simple wrapper
  def __getitem__(self, index):
    return self.callnumbers[index]

  def __str__(self):
    return self.callnumbers.__str__()

  #Takes a callnumber sheet and returns a sorted list of callnumbers
  @classmethod
  def quicksort(cls, sheet):
    return quicksort(sheet.callnumbers)


def testSheet():
  cna = CallNumber(["PN", 1956, "A", 3302])
  cnb = CallNumber(["B", 3012, "F", 45])
  sheet = CallNumberSheet(cna, cnb)
  print(sheet)
  print(CallNumberSheet.quicksort(sheet))

testSheet()