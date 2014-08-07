alpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
def tokenizeLC(cn_string):
  tags = cn_string.split(' ')
  for tag in tags:
    

class CallNumber():
  def __init__(self, cn_string):
    self.tokens = tokenizeLC(cn_string)
  
  def __lt__(self, other):
  def __gt__(self, other):
    #Compare each token. If token is GREATER, then the whole is LESS.
  def __eq__(self, other):
    return self.tokens == other.tokens
  def __ne__(self, other):
    return self.tokens != other.tokens
