package main

import (
    "fmt"
  )

func main() { }

func sumprodiffanon(a int, b int) (int, int, int) {
    return a + b, a*b, a - b
}

func somprodiff(a int, b int) (sum int, product int, difference int) {
    sum = a + b
    product = a * b
    difference = a - b
    return sum, product, difference
}
