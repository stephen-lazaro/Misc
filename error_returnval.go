package main

import (
    "fmt"
    "errors"
    "math"
    )

func MySqrt(a float32) (root float32, err error) {
    if a < 0 {
        root = -1
        err  = errors.New("That's a negative number! We don't have complex square roots kid.")
        return
    } else {
        root = float32(math.Sqrt(float64(a)))
        err  = nil
        return
    }
}

func main() {
    i, j float32
    err error
    i, j = 45,-45
    i,err = MySqrt(i)
    fmt.Println(err)
    fmt.Println(i)
    j,err = MySqrt(j)
    fmt.Println(err)
    fmt.Println(j)
}
