module bin-tree where

data BinaryNode a = BinaryNode {left :: (Maybe BinaryNode), right :: (Maybe BinaryNode), data :: a}
                    |Empty
                    deriving (Show)

--Finding the height of a binary tree
max :: Int -> Int -> Int
max n m =
  |n < m     = m
  |otherwise = n

height :: BinaryNode -> Int
height Empty = 0
height node = maxis (height (left node)) (height (right node))

--Let's construct a completely balanced tree given a number of nodes
--Such a tree must have the difference between right and left subtrees less than or equal to 1
cbal_tree :: [BinaryNode] -> BinaryNode
cbal_tree 0 = Empty
cbal_tree n = 
  |n rem 2 == 1 = BinaryNode (cbal_tree (n / 2)) (cbal_tree ((n / 2) + 1)) n
  |otherwise    = BinaryNode (cbal_tree (n / 2)) (cbal_tree (n / 2)) n

--Let's check if a tree is symmetric
