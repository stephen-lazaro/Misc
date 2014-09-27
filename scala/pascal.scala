object Pascal {
	def getPascal(c: Int, r:Int): Int = {
		if (r == 0 && c == 0) {
			return 1
		}
		if (c == 0 || c == r) {
			return 1
		}
		if (r < 0 || c < 0 || c > r) {
			return 0
		}
		getPascal(c-1, r-1) + getPascal(c, r-1)
	}
	def main(args : Array[String]) {
		for (row <- 0 to 10) {
			for (col <- 0 to 10) {
				println(getPascal(col,row) + " ")
			}
			println()
		}
	}
}