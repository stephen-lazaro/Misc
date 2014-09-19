//Euler2.scala
//This doesn't compile
//There's some type ambiguity problem
object Euler2 {
	class Fibonacci {
		val fibs = List(0, 1)
		def next() : Int = {
			fibs match {
				case x :: y :: fibs =>
				    x + y :: x :: y :: fibs
				    x + y
				case List() =>
				    0
			}
		}
	}
	def main(args : Array[String]) = {
		val fibs : Fibonacci = new Fibonacci()
		val acc = List()
		var nextItem : Int = fibs.next()
		while (nextItem < 4000000) {
			nextItem :: acc
			nextItem = fibs.next()
		}
		val answer : Int = acc.sum
		println(answer)
	}
}