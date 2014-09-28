object ChangeCount {
	def countChange(money: Int, coins: List[Int]): Int = {
		if (money == 0) 1
		else if (coins.isEmpty || money < 0) 0
		else coutnChange(money - coins.head, coins) + countChange(money, coins.tail)
	}
	def main(args: Array[String]) = {
		println(countChange(args(0), []))
	}
}