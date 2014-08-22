//Works perfectly. Nice that we can return an error value and just test against that instead of doing try catch idioms.
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
    var i, j float32
    var err error
    i, j = 45,-45
    i,err = MySqrt(i)
    fmt.Println(err)
    fmt.Println(i)
    j,err = MySqrt(j)
    fmt.Println(err)
    fmt.Println(j)
}
