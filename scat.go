//Simple CAT
package main

import (
    "fmt"
    "bufio"
    "os"
    )

func main() {
    fmt.Println("What two files do you want to concatenate? Separate with spaces, please.")
    fmt.Scanln(&first, &second)
    firstFile := openFile(first)
    secondFile := openFile(second)
    acc := ""
    readInto(firstFile, &acc)
    readInto(secondFile, &acc)
    writeResult(makeNewFile(first, second), &acc)
}

func writeResult(concatd bufio.Writer, material *string) {
    success, err := concatd.writeString(*string)
    if err != nil {
        fmt.Println("Writing failed!")
        os.Exit(1)
    }
}

func copyDirect(dest *os.File, srcA *os.File, srcB *os.File) int {
    defer *srcA.Close()
    defer *srcB.Close()
    defer *dest.Close()
    aReader := bufio.NewReader(*srcA)
    bReader := bufio.NewReader(*srcB)
    dest    := bufio.NewWriter(*dest)
    _, err := io.Copy(*dest, *srcA)
    if err != nil {
        fmt.Println("First file copy failed!")
        return 1
    }
    _, err := io.Copy(*dest, *srcB)
    if err != nil {
        fmt.Println("Second file copy failed!")
        return 2
    }
    return 0
}

func openFile(filename string) bufio.Reader {
    filehand, err := os.Open(&filename)
    if err != nil {
        fmt.Println("Are you sure that was a file?")
        os.Exit(-1)
    }
    defer filehand.Close()
    filereader = bufio.NewReader(filehand)
    return filereader
}

func makeNewFile(filenameA *string, filenameB *string) bufio.Writer {
    newName := *filenameA + "&" + *filenameB + ".txt"
    newFile := os.Create(newName)
    defer newFile.Close()
    newFileWriter := bufio.NewWriter(newFile)
    return newFileWriter
}

