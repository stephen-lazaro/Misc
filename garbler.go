package main

import (
  "fmt"
  "bufio"
  "os"
  )

var letterShift map[string]string = map[string]string{"a": "e", "e": "i", "i": "o", "o":"u", "u": "a"}

func main() {
    fmt.Println("What do you want me to garble?")
    var filename string
    bytes, err := fmt.Scanln(filename)
    if err != nil {
        fmt.Println("I did not understand anything you just said, honestly.")
        os.Exit(1)
    }
    garblee := openFile(filename)
    garbled := garble(garblee)
    printToOut(garbled)
}


func openFile(filename string) *bufio.Reader{
    filed, err := os.Open(filename)
    if err != nil {
        os.Exit(1)
    }
    filebuffer := bufio.NewReader(filed)
    defer filed.Close()
    return filebuffer
}

func garble(garblee *bufio.Reader) string {
    acc := ""
    for character,position := range *garblee {
        _,err := letterShift[character]
        if err != nil {
            acc += character
         } else {
            acc += letterShift[character]
        }
    }
    return acc
}

func printToOut(garbled string) {
    empty, err := os.Create("garbled.txt")
    if err != nil {
        os.Exit(1)
    }
    _, err = empty.WriteString(garbled)
    if err != nil {
        os.Exit(1)
    } else {
        os.Exit(0)
    }
}
