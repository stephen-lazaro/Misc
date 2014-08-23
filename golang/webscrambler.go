package main

import (
  "fmt"
  "bufio"
  "http"
  "os"
  )

func main() {
    var url string
    getURL(&url)
    page := getPage(url)
    var contents string
    readFromPage(&contents)
    tokenize(contents)
}

func tokenize(page *string) {
    
}

func getURL(storage *string) {
    fmt.Println("Hey man")
    fmt.Scanln(storage)
}

func openPage(pageURL string) *http.Request {
    page, err := http.NewRequest("GET", pageURL, bufio.NewReader())
    if err != nil {
        fmt.Println("Oh shit no page breh")
        os.Exit(-1)
        }
    return &page
}

func getPage(pageURL string) *io.ReadCloser {
    page := http.Get(pageURL)
    content := bufio.NewReader(page.Body)
    return &content
}

func readFromPage(destinate *string, request *io.ReadCloser) (int, error) {
    for {
        inputLine, err := content.ReadLine()
        if err != nil {
            fmt.Println("Reading broken")
            os.Exit(1)
        }
        for pos, char := range inputLine {
            //Do something.
        }
    }
}
