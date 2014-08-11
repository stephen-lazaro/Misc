package main

import (
       "net/http"
       "fmt"
       "log"
       "bufio"
)
//Get me the first five lines of the webpages given

func main() {
  url := fmt.Scanln()
  req, err := http.Get(url)
  if err != nil {
    log.Fatal(err)
  }
  i := 0
  for i < 5 {
    linez, err := bufio.ReadLine(req.Body)
    if err != nil {
      log.Fatal(err)
    }
    fmt.Println(linez)
    i = i + 1
  }
}