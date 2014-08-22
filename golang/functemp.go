package main

import "fmt"


func celsiusToFarenheit(cels float32) float32 {
  return (5.0 / 9.0) * (cels + 32.0)
}

func farenheitToCelsius(fahr float32) float32 {
  return (9.0 / 5.0) * (fahr - 32.0)
}

func main() {
  var i int
  fmt.Printf("%s\t%s\n", "Farenheit", "Celsius")
  for i <= 15 {
    fmt.Printf("%f\t%f\n", 20.0 * float32(i), farenheitToCelsius(20.0 * float32(i)))
    i++
  }
  fmt.Printf("%s\t%s\n", "Celsius", "Farenheit")
  for i >= 0 {
    fmt.Printf("%f\t%f\n", 20.0 * float32(i), celsiusToFarenheit(20.0 * float32(i)))
    i--
  }
}