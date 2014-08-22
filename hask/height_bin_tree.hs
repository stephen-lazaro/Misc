--Find the height of a binary tree.

max n m =
  |n < m     = m
  |otherwise = n

data Tree a = Node a (Tree a) (Tree a)
              |Empty

lefkin :: Tree a -> Tree a
lefkin tree = Tree m _

rikin tree = Tree _ m

height :: Tree a -> Int
height Empty = 0
height tree  = max (1 + (height (lefkin tree))) (1 + (height (rikin tree)))
