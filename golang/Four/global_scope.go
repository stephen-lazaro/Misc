package main
var a = "G"
func main() {
  n()
  m()
  n()
}

func n() {
  print(a)
}

func m() {
  a = "0"
  print(a)
}
//Should have output "G" "G'
//No! It's "G""0""0"