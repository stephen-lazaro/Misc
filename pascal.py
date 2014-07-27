'''Note that Pascal's triangle is symmetric, so we should always replace r > c/2 by c - r
This way we can always count from the left, instead of from the right
The tactic will be to reduce to a tree like structure. Each tree will have a right and a left child  node, but neighbor nodes will have identical right-left children respectively.
'''

class PascalNode:
  def __init__(self, lefparen, riparen):
    self.lefparen, self.riparen = lefparen, riparen
    if self.lefparen is None:
      self.value = 1
    elif self.riparen is None:
      self.value = 1
    else:
      self.value = self.lefparen.value + self.riparen.value

  def rikin(self):
    if self.riparen is None:
      return PascalNode(self, None)
    return PascalNode(self, self.riparen.rikin())

  def lefkin(self):
    if self.lefparen is None:
      return PascalNode(None, self)
    return PascalNode(self.lefparen.lefkin(), self)

#What I want is a way to measure my depth, but this is hard to do.#
#Simpler is to just use r and c as parameters on a while loop.#

def findMyNode(r, c):
  current_node = PascalNode(Null, Null)
  while r != 0 and c !=0:
    if r == 1:
      current_node = PascalNode(currentnode.riparen, currentnode.riparen.rikin().riparen)
      c -= 1
      if r == 1 and c == 1:
        current_node = PascalNode(currentnode.lefparen.lefkin(), currentnode)
    else:
      current_node = PascalNode(None, currentnode)
      r -= 1
  return current_node
