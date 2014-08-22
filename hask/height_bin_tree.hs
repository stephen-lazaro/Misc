--Find the height of a binary tree.

max n m =
  |n < m     = m
  |otherwise = n

data Tree a = Node a { lefkin :: (Tree a), rikin :: (Tree a) }
              |Empty
               deriving (Show)



height :: Tree a -> Int
height Empty = 0
height tree  = max (1 + (height (lefkin tree))) (1 + (height (rikin tree)))
