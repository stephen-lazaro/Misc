package main

import (
  "fmt"
  "bufio"
  "os"
  "string"
  )

const letterShift map[string]string
letterShift["a"] = "e"
letterShift["e"] = "i"
letterShift["o"] = "u"
letterShift["u"] = "a"

func main() {
    fmt.Println("What do you want me to garble?")
    filename, err := fmt.Scanln()
    if err != nil {
        fmt.Println("I did not understand anything you just said, honestly.")
        os.Exit(1)
    }
    garblee = openFile(filename)
    garbled = garble(garblee)
    printToOut(garbled)
}


func openFile(filename string) bufio.Reader{
    filed := os.Open(filename)
    filebuffer = bufio.NewReader(filed)
    defer filed.Close()
    return filebuffer
}

func garble(garblee bufio.Reader) string {
    acc := ""
    for character,position := range garblee {
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
    empty := os.Create("garbled.txt")
    _, err := empty.WriteString(string)
    if err != nil {
        os.Exit(1)
    }
    else {
        os.Exit(0)
    }
}
