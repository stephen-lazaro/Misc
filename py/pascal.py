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

  def __str__(self):
    return "Node Value:" + self.value
#What I want is a way to measure my depth, but this is hard to do.#
#Simpler is to just use r and c as parameters on a while loop.#

def findMyNode(r, c):
  if r + 1 == c:
    return PascalNode(1, None)
  elif r + 1 < c:
    return None
  current_node = PascalNode(None, None)
  while r != 0 and c != 1:
    if r == 1:
      current_node = PascalNode(current_node.riparen, current_node.riparen.rikin().riparen)
      c -= 1
      if r == 1 and c == 1:
        current_node = PascalNode(current_node.lefparen.lefkin(), current_node)
    else:
      current_node = PascalNode(None, current_node)
      r -= 1
  return current_node
