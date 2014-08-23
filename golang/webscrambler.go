package main

import (
  "fmt"
  "bufio"
  "http"
  "os"
  )

//Tree node data type
type Node struct {
    children []Node
    content string
}

//HTML Tree node data type
type HtmlNode struct {
    children []HtmlNode
    textcontent string
    tag string
}

func (self *Node) Children() {
    return (*self).children
}

func (self *Node) Childless() bool {
    if (*self).children == nil {
        return True
    } else if (*self).children == {
        return True
    } else {
        return False
    }
}

func (self *Node) Content() {
    return (*self).content
}

func (self *Node) Width() int {
    return len((*self).children)
}

func (self *Node) Height() int {
    if (*self).Childless() {
        return 0
    } else {
        acc := []int
        for child,_ := range (*self).Children() {
            acc.append(1 + child.Height())
        }
        return max(acc)
    }
}

func (self *Node) Append(toBeAdded ..*Node) {
    for node, _ := range toBeAdded {
        append((*self).children, *node)
    }
}

func (self *HtmlNode) TagType() string {
    return (*self).tag
}

//An interface for nodes
type Node interface {
    Children()
    Content() string
}

//Implementation for Html Nodes
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