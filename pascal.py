'''Note that Pascal's triangle is symmetric, so we should always replace r > c/2 by c - r
This way we can always count from the left, instead of from the right
The tactic will be to reduce to a tree like structure. Each tree will have a right and a left child  node, but neighbor nodes will have identical right-left children respectively.
'''

class PascalNode:
  def __init__(self, lefparen, riparen):
    if lefparen is None:
      self.value = 1
    elif riparen is None:
      self.value = 1
    else:
      self.value = self.lefparen.value + self.riparen.value

  def rikin(self):
    if self.riparen is None:
      return PascalNode(self, None)
    return PascalNode(self, self.riparen.rikin)

  def lefkin(self):
    if self.lefparen is None:
      return PascalNode(None, self)
    return PascalNode(self.lefparen.lefkin, self)
