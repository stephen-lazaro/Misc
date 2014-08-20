//Simple CAT
package main

import (
    "fmt"
    "bufio"
    "os"
    )

func main() {
    var first, second string
    fmt.Println("What two files do you want to concatenate? Separate with spaces, please.")
    fmt.Scanln(&first, &second)
    firstFileReader := openFile(first)
    secondFileReader := openFile(second)
    acc := ""
    dest := makeNewFile(&first, &second)
    readInto(&acc, firstFileReader)
    readInto(&acc, secondFileReader)
    writeResult(dest, &acc)
}

func readInto(destin *string, sourz *bufio.Reader) { }

func writeResult(concatd *bufio.Writer, material *string) {
    success, err := concatd.WriteString(*material)
    if err != nil {
        fmt.Println("Writing failed!")
        os.Exit(1)
    }
}

func openFile(filename string) *bufio.Reader {
    filehand, err := os.Open(filename)
    if err != nil {
        fmt.Println("Are you sure that was a file?")
        os.Exit(-1)
    }
    defer filehand.Close()
    filereader := bufio.NewReader(filehand)
    return filereader
}

func makeNewFile(filenameA *string, filenameB *string) *bufio.Writer {
    newName := *filenameA + "&" + *filenameB + ".txt"
    newFile, err := os.Create(newName)
    if err != nil {
        fmt.Println("Whoa that went sideways, no file creation for you")
        os.Exit(1)
    }
    newFileWriter := bufio.NewWriter(newFile)
    return newFileWriter
}

