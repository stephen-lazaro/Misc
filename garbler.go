package main

import (
  "fmt"
  "bufio"
  "os"
  "io"
  )

var letterShift map[string]string = map[string]string{"a": "e", "e": "i", "i": "o", "o":"u", "u": "a"}

func main() {
    fmt.Println("What do you want me to garble?")
    var filename string
    _, err := fmt.Scanln(&filename)
    if err != nil {
        fmt.Println("I did not understand anything you just said, honestly.")
        os.Exit(1)
    }
    src, garblee := openFile(filename)
    garbled := garble(garblee)
    dest,_ := printToOut(garbled)
    dest.Close()
    src.Close()
}


func openFile(filename string) (*os.File, *bufio.Reader) {
    fmt.Println("Opening a file!")
    filed, err := os.Open(filename)
    if err != nil {
        os.Exit(1)
    }
    filebuffer := bufio.NewReader(filed)
    return filed, filebuffer
}

func garble(garblee *bufio.Reader) string {
    acc := ""
    for  {
        inputLine, err := garblee.ReadString('\n')
        if err == io.EOF {
            break
        } 
        for _,character := range inputLine { 
            shiftd, errz := letterShift[string(character)]
            if errz == false {
                acc += string(character)
            } else {
                acc += string(shiftd)
            }
        }
    }
    return acc
}

func printToOut(garbled string) (*os.File, error) {
    fmt.Println("Creating a file!")
    empty, err := os.Create("garbled.txt")
    if err != nil {
        os.Exit(1)
    }
    for _,charac := range garbled {
        _, err := empty.WriteString(string(charac))
        if err != nil {
            fmt.Println("What. Writing Failed.")
            return empty, err
        }
    }
    return empty, err
}
