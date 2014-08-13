package main

import (
  "fmt"
)

func naturalNumbers() chan int {
  yield := make (chan int)
  count := 0
  go func() {
    for {
      yield <- count;
      count++;
    }
  }  ();
  return yield
}

func evens() chan int {
  yield := make (chan int)
  count := 0
  go func() {
    for {
      yield <- (2*count);
      count++;
    } 
  } ();
  return yield
}

func fibs() chan int {
  yield := make (chan int)
  m, n := 0,1
  go func() {
    for {
      yield <- (n);
      m, n = n, m + n;
    }
  } ();
  return yield
}

func main() {
  resume := naturalNumbers()
  generateNatural := func() int {return <-resume}
  fmt.Printf("%d\n", generateNatural())
  fmt.Printf("%d\n", generateNatural())
  fmt.Printf("%d\n", generateNatural())
  evsume := evens()
  generateEvens := func() int { return <-evsume}
  fmt.Printf("%d\n", generateEvens())
  fmt.Printf("%d\n", generateEvens())
  fmt.Printf("%d\n", generateEvens())
  fibsume := fibs()
  generateFibs := func() int { return <-fibsume}
  %This kind of pleasantly shows where overflow on int occurs for some compilers!
  for i:=0; i<55; i++ {
    fmt.Printf("%d\n", generateFibs())
  }
}