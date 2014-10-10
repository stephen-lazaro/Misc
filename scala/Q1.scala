package recfun
import common._

object Main {
  def main(args: Array[String]) = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (r == 0 && c == 1) 1
    else if (c == 0 || c == r) 1
    else if (r < 0 || c < 0 || c > r)  0
    else pascal(c, r-1) + pascal(c-1, r-1)
  }
  /**
   * Exercise 2
   */
  def balance(chars: List[Char]): Boolean = {
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
  /**
   * Exercise 3
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money == 0) 1
    else if (coins.isEmpty || money < 0) 0
    else countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }
}