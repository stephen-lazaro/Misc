object Balance {
	def isBalance(chars: List[Char]): Boolean = {
	    def in(chars: List[Char], degree: Integer): Boolean = {
	      if (chars.isEmpty) false
	      else if (chars.head == ')') {
	        if (degree == 1)  out(chars.tail)
	        else in(chars.tail, degree - 1)
	      } 
	      else if (chars.head == '(') in(chars.tail, degree + 1)
	      else in(chars.tail, degree)
	    }
	    def out(chars: List[Char]): Boolean = {
	      if (chars.isEmpty) true
	      else if (chars.head == '(') in(chars.tail, 1)
	      else if (chars.head == ')') false
	      else out(chars.tail)
	    }
	    out(chars)
	  }
	def main(args: Array[String]) {
		val tbt = args(0).toList
		println(isBalance(tbt) + " ")
	}
}