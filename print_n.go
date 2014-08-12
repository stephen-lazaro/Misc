package main

import (
    "fmt"
    "log"
)

func main() {
  var m int
  _, err := fmt.Scanf("%d", &m)
  if err != nil {
    log.Fatal(err)
  }
  for i:=0; i < m; i++ {
    fmt.Printf("%d\n", i)
  }
}