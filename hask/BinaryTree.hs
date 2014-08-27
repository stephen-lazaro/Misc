module BinaryTree where

data BinaryNode a = BinaryNode {left :: BinaryNode a, right :: BinaryNode a, content :: a}
                    |Empty
                    deriving (Show)

--Finding the height of a binary tree
maxis :: Integer -> Integer -> Integer
maxis n m
  |n < m     = m
  |otherwise = n

height :: BinaryNode a -> Integer
height Empty = 0
height node = maxis (height (left node)) (height (right node))

--Counting the nodes in a tree
nodez :: BinaryNode a -> Integer
nodez Empty = 0
nodez (BinaryNode a b _) = 1 + (nodez a) + (nodez b)

--Let's construct a completely balanced tree given a number of nodes
--Such a tree must have the difference between right and left subtrees less than or equal to 1
--I actually don't think this logic will work! It'll lean to the right
cbal_tree :: Integer -> BinaryNode Integer
cbal_tree 0 = Empty
cbal_tree n 
        | (rem n 2) == 1 = BinaryNode evenSubtree oddSubtree n
        | otherwise      = BinaryNode evenSubtree evenSubtree n
    where evenSubtree = cbal_tree (quot n 2)
          oddSubtree  = cbal_tree ((quot n 2) + 1)
abz n
  | n < 0     = -n 
  | otherwise = n


is_balanced :: BinaryNode a -> Bool
is_balanced (BinaryNode a b _) = sideDifference <= 1
    where sideDifference = abz ((nodez a) - (nodez b))

--Let's check if a tree is symmetric
