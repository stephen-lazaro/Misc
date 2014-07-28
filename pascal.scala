object Math {
 trait NodeLike[T] {
 }
 object NodeLike {
 }
}

public class PascalNode(lefparen:PascalNode, riparen:PascalNode):
  def rightup = riparen
  def leftup = lefparen
  val value = leftup.vlue + rightup.value 

  }
 }
    