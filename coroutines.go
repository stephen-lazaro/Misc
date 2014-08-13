package main

import (
  "fmt"
)

func naturalNumbers() chan uint32 {
  yield := make (chan uint32)
  count := 0
  go func() {
    for {
      yield <- count;
      count++;
    }
  }  ();
  return yield
}

func evens() chan uint32 {
  yield := make (chan uint32)
  count := 0
  go func() {
    for {
      yield <- (2*count);
      count++;
    } 
  } ();
  return yield
}

func fibs() chan uint32 {
  yield := make (chan uint32)
  m, n := 0,1
  go func() {
    for {
      yield <- n;
      m, n = n, m + n;
    }
  } ();
  return yield
}

func factorialz() chan uint32 {
  yield := make (chan uint32)
  m, n := 1,1
  go func() {
    for {
      yield <- m;
      m, n = n, (m+1)*n;
    }
  }  ();
}

func main() {
  resume := naturalNumbers()
  generateNatural := func() uint32 {return <-resume}
  fmt.Printf("%d\n", generateNatural())
  fmt.Printf("%d\n", generateNatural())
  fmt.Printf("%d\n", generateNatural())
  evsume := evens()
  generateEvens := func() uint32 { return <-evsume}
  fmt.Printf("%d\n", generateEvens())
  fmt.Printf("%d\n", generateEvens())
  fmt.Printf("%d\n", generateEvens())
  fibsume := fibs()
  generateFibs := func() uint32 { return <-fibsume}
  %This kind of pleasantly shows where overflow on int occurs for some compilers!
  for i:=0; i<55; i++ {
    fmt.Printf("%d\n", generateFibs())
  }
  factsume := factorialz()
  generateFacts := func() uint43 { return <-factsume}
  for j:=0; j<10; j++ {
    fmt.Printf("%d\n", generateFacts())
  }
}
