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
    Children
    Content
}

//NodeLike methods
func (self *NodeLike) Childless() bool {
    if (*self).Children == nil {
        return True
    } else if len((*self).Children) == 0 {
        return True
    } else {
        return False
    }
}

func (self *NodeLike) Width() int {
    return len((*self).Children())
}

func (self *NodeLike) Height() int {
    if (*self).Childless() {
        return 0
    } else {
        var acc []int
        for child,_ := range (*self).Children() {
            acc.append(1 + child.Height())
        }
        return maxOf(acc)
    }
}

func (self *NodeLike) Append(toBeAdded ...*Node) {
    for node, _ := range toBeAdded {
        append((*self).Children(), *node)
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
func (self *HtmlNode) Children() {
    return (*self).children
}

func (self *HtmlNode) Content() {
    return (*self).textcontent
}

//EmptyNode shouldn't really do anything
type EmptyNode struct {
}

func (*EmptyNode) Right() {
}

func (*EmptyNode) Left() {
}

func (*EmptyNode) Content() {
}

func main() {
    var url string
    getURL(&url)
    page := getPage(url)
    var contents string
    readFromPage(&contents)
    makeDOM(contents)
}

func makeDOM(page *string) *Node {

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
        for _, char := range inputLine {
            (*desinate) += char
        }
    }
}