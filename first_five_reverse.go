package main

import (
       "net/http"
       "fmt"
       "log"
       "io/ioutil"
//       "bufio"
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
  fmt.Println(ioutil.ReadAll(req.Body))
/*  i := 0
  for i < 5 {
    linez, err := bufio.ScanLine(req.Body)
    if err != nil {
      log.Fatal(err)
    }
    fmt.Println(linez)
    i = i + 1
  }*/
  req.Body.Close()
}