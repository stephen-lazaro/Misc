package main
var a string

func main() {
  a = "G"
  print(a)
  f1()
}

func f1() {
  a := "0"
  print(a)
  f2()
}

func f2() {
  print(a)
}

//Should be "G" "0" "0"
//No! It outputs "G" "0" "G"