// fibonacci2.go an exercise from The Way to Go
package main

import "fmt"

func fibonacci2(n int) (res int, pos int) {
    if n <= 1 {
        res = 1
        pos = 1
        return
    } else {
    	a, _ := fibonacci2(n - 1)
        b, _ := fibonacci2(n - 2)
        res = a + b
        pos = n
        return
    }
}

func main() {
	a, b := fibonacci2(1)
	fmt.Println(a)
	fmt.Println(b)
	a, b = fibonacci2(5)
	fmt.Println(a)
	fmt.Println(b)
}