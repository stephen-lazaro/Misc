object Pascal {
	def getPascal(c: Int, r:Int): Int = {
		if (r == 0 && c == 0) 1
		else if (c == 0 || c == r) 1
		else if (r < 0 || c < 0 || c > r) 0
		else getPascal(c-1, r-1) + getPascal(c, r-1)
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