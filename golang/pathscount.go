//pathscount.go
package main

import "fmt"

func getPathCount(dimr int64) int64 {
	var pathz int64 = 1
	var i int64 = 0
	for i < dimr {
		pathz *= (2 * dimr) - i
		pathz /= i + 1
		i++
	}
	return pathz
}

func main() {
	fmt.Println(getPathCount(int64(20)))
}