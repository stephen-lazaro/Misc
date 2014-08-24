package main

import (
  "fmt"
  "bufio"
  "net/http"
  "os"
  )

//Get's the maximum element of a slice of integers
func maxOf(lz []int) (maxis int) {
    maxis = 0
    for i,_ := range lz {
        if i > maxis {
            maxis = i
        }
    }
    return
}

//NodeLike interface
type NodeLike interface{
    Children() []NodeLike
    Content() string
}

//NodeLike functions
func Childless(self *NodeLike) bool {
    if (*self).Children() == nil {
        return true
    } else if len((*self).Children()) == 0 { //Not the right way to test for empty slice
        return true
    } else {
        return false
    }
}

func Width(self *NodeLike) int {
    kiddens := (*self).Children()
    return len(kiddens)
}

func Height(self *NodeLike) int {
    if Childless(self) {
        return 0
    } else {
        var acc []int
        kiddens := (*self).Children()
        for _, child := range kiddens {
            heightAtChild := Height(&child)
            acc = append(acc, heightAtChild) //Logic wrong?
        }
        return maxOf(acc)
    }
}

func Append(self *NodeLike, toBeAdded...NodeLike) {
    kiddens := (*self).Children() 
    for _, node := range toBeAdded {
        kiddens = append(kiddens, node)
    }
}

//HTML Tree node data type
type HtmlNode struct {
    children []HtmlNode
    textcontent string
    tag string
}

func (self *HtmlNode) TagType() string {
    return (*self).tag
}

//Implementation for Html Nodes of NodeLike
func (self *HtmlNode) Children() []HtmlNode {
    return (*self).children
}

func (self *HtmlNode) Content() string {
    return (*self).textcontent
}

//EmptyNode shouldn't really do anything
type EmptyNode struct {
}

func (*EmptyNode) Children() []EmptyNode {
    var e []EmptyNode
    return e
}

func (*EmptyNode) Content() {
}

func main() {
    var url string
    getURL(&url)
    page := getPage(url)
    var contents []byte
    readFromPage(contents, page)
    pagez := string(contents)
    makeDOM(&pagez)
}

func makeDOM(page *string) *HtmlNode {
    return new(HtmlNode)
}

func getURL(storage *string) {
    fmt.Println("Hey man")
    fmt.Scanln(storage)
}

func getPage(pageURL string) *bufio.Reader {
    page, err := http.Get(pageURL)
    if err != nil {
        fmt.Println("Failure to get URL")
        os.Exit(2)
    }
    content := bufio.NewReader(page.Body)
    return content
}

func readFromPage(destinate []byte, request *bufio.Reader) (int, error) {
    for {
        inputLine, err := request.ReadString('\n')
        if err != nil {
            fmt.Println("Reading broken")
            os.Exit(1)
        }
        for _, char := range inputLine {
            destinate = append(destinate, byte(char))
        }
    }
}