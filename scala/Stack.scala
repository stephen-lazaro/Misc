
class Stack<+T> {
	case class Empty<T>
	case class NEmpty<T>: Stack<T>
	val t = List()
	def isEmpty() {
		this match {
			case Empty => true
			case NEmpty => false
			case _ => false
		}
	}
	def cons(a: T, rst: Stack<T>): Stack<T> = {
		List(a, rst)
	}
    def head(): T = {
    	t.head
    }
    def tail(): Stack<T> = {
    	t.tail
    }
}