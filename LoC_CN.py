alpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
def tokenizeLC(cn_string):
  tags = cn_string.split(' ')
  for tag in tags:
    

class CallNumber():
  def __init__(self, cn_string):
    self.tokens = tokenizeLC(cn_string)
  
  def __lt__(self, other):
    if self == other:
      return False
    for i in range(len(self.tokens)):
      try:
        if self.tokens[i] < other.tokens[i]:
          return True
        return False
      except IndexError:
        return False #Only happens if every token in self is same as every token in other but self has more. So other is earlier.

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

  def __eq__(self, other):
    return self.tokens == other.tokens

  def __ne__(self, other):
    return self.tokens != other.tokens
