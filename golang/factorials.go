package main

import (
  "fmt"
  )

func fact(n uint32) uint32 {
  if n == 0 {
    return 1
  } else {
    return n * fact(n - 1)
  }
}

func main() {
  for i := 0; i<6; i++ {
    fmt.Printf("%d\n", fact(uint32(i)))
  }
}
