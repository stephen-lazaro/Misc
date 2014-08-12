//fib

package main

import (
    "fmt"
    "bufio"
    )

//Let's get the nth fibonacci number
//We assume numbers are unsigned since only works for positives anyway
func fib(n uint32) uint32 {
  m, k := 0, 1
  for i := 0; i < n; i++ {
    m, k = k, m+k
  }
  return k
}

func main() {
  var n uint32
  _, err := fmt.Scanf("%d", &n)
  fmt.Printf("%d\n", fib(n))
}
