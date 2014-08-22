//Works perfectly! Very cool the way that Go makes the syntax pretty expressive.
package main

import (
    "fmt"
  )

func main() {
    i,j := 5,6
    s,p,d := sumprodiff(i, j)
    fmt.Println(s)
    fmt.Println(p)
    fmt.Println(d)
}

func sumprodiffanon(a int, b int) (int, int, int) {
    return a + b, a*b, a - b
}

func sumprodiff(a int, b int) (sum int, product int, difference int) {
    sum = a + b
    product = a * b
    difference = a - b
    return //we could put the names here, but it's a better example of the named returns not to write them
}
