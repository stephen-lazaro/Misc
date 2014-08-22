package main

import (
       "net/http"
       "fmt"
       "log"
       "bufio"
)
//Get me the first five lines of the webpages given

func main() {
  url, err := fmt.Scanln()
  if err != nil {
    log.Fatal(err)
  }
  req, err := http.Get(string(url))
  if err != nil {
    log.Fatal(err)
  }
  for i := 0; i < 5; i++ {
    linez, err := bufio.ReadLine(req.Body)
    if err != nil {
      log.Fatal(err)
    }
    fmt.Println(linez)
  }
  req.Body.Close()
}