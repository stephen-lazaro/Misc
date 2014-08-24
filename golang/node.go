//Node Tools
package node

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
    children []NodeLike
    textcontent string
    tag string
}

func (self *HtmlNode) TagType() string {
    return self.tag
}

//Implementation for Html Nodes of NodeLike
func (self *HtmlNode) Children() []NodeLike {
    return self.children
}

func (self *HtmlNode) Content() string {
    return self.textcontent
}

//Binary tree data type
type BinaryNode struct {
    children [2]NodeLike
    content string
}

//BinaryNode implementation of NodeLike
func (self *BinaryNode) Children() [2]NodeLike {
    return self.children
}

func (self *BinaryNode) Content() string {
    return self.content
}

//BinaryNode Methods
func (self *BinaryNode) Left() *NodeLike {
    return &self.children[0]
}

func (self *BinaryNode) Right() *NodeLike {
    return &self.children[1]
}

//I know this is terrible looking, but it's straightforward.
func (self *BinaryNode) Append(side string, nodez *NodeLike) int {
    if side == "right" {
        if self.Right() == nil {
            self.children[0] = *nodez
            return 0
        } else {
            return 1
        }
    } else if side == "left" {
        if self.Left() == nil {
            self.children[1] = *nodez
            return 0
        } else {
            return 1
        }
    } else {
        return -1
    }
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