//Euler1 Scala
object Euler1 {
	def main(args: Array[String]) = {
		val data = 0 until 1000
		data.foreach((x:Int) => if (x % 3 == 0 || x % 5 == 0) { x } else { 0 }  )
		val answer = data.sum
		println(answer)
	}
}