object Balance {
	def isBalance(chars: List[Char]): Boolean = {
		def in(chars: List[Char], degree: Integer): Boolean = {
			if (chars.isEmpty) {
				return false
			} else if (chars.head == ')') {
				if (degree == 1) {
					return out(chars.tail)
				} else {
					return in(chars.tail, degree - 1)
				}
			} else if (chars.head == '(') {
				return in(chars.tail, degree + 1)
			} else {
				return in(chars.tail, degree)
			}
		}
		def out(chars: List[Char]): Boolean = {
			if (chars.isEmpty) {
				return true
			} else if (chars.head == '(') {
				return in(chars.tail, 1)
			} else if (chars.head == ')') {
				return false
			} else {
				return out(chars.tail)
			}
		}
		return out(chars)
	}
	def main(args: Array[String]) {
		val tbt = args(0).toList
		println(isBalance(tbt) + " ")
	}
}