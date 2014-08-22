//Simple CAT
package main

import (
    "fmt"
    "bufio"
    "os"
    "io"
    )

func main() {
    var first, second string
    fmt.Println("What two files do you want to concatenate? Separate with spaces, please.")
    fmt.Scanln(&first, &second)
    firstHand, firstFileReader := openFile(first)
    secondHand, secondFileReader := openFile(second)
    acc := ""
    destHand, destWriter := makeNewFile(&first, &second)
    readInto(&acc, firstFileReader)
    readInto(&acc, secondFileReader)
    fmt.Println(acc)
    r := writeResult(destWriter, &acc)
    fmt.Println(r)
    firstHand.Close()
    secondHand.Close()
    destHand.Close()
}

func readInto(destin *string, sourz *bufio.Reader) *string {
    fmt.Println("Reading!")
    for {
        inputLine, err := sourz.ReadString('\n')
        fmt.Println("Reading...")
        if err == io.EOF {
            break
        } else if err != nil {
            fmt.Println("Something went awry!")
            os.Exit(-1)
        }
        for _,character :=  range inputLine {
            fmt.Println("Adding characters...")
            *destin += string(character)
        }
    }
    *destin += "\n"
    return destin
}

func writeResult(concatd *bufio.Writer, material *string) int {
    fmt.Println("Writing!")
    _,err := concatd.WriteString(*material)
    if err != nil {
        fmt.Println("No writing for you!")
        return -1
    } else {
        fmt.Println("No error")
        concatd.Flush()
        return 1
    }
}

func openFile(filename string) (*os.File, *bufio.Reader) {
    fmt.Println("Opening!")
    filehand, err := os.Open(filename)
    if err != nil {
        fmt.Println("Are you sure that was a file?")
        os.Exit(-1)
    }
    filereader := bufio.NewReader(filehand)
    return filehand, filereader
}

func makeNewFile(filenameA *string, filenameB *string) (*os.File, *bufio.Writer) {
    untxtA, untxtB := (*filenameA)[0:len(*filenameA) - 4], (*filenameB)[0:len(*filenameB) - 4]
    newName := untxtA + "_and_" + untxtB + ".txt"
    newFile, err := os.OpenFile(newName, os.O_WRONLY|os.O_CREATE, 0666)
    if err != nil {
        fmt.Println("Whoa that went sideways, no file creation for you")
        os.Exit(1)
    }
    newFileWriter := bufio.NewWriter(newFile)
    return newFile, newFileWriter
}

