--bin-tree test
module Main where

import BinaryTree


main = interact balanceTree
  where balanceTree = (show (nodez (cbal_tree 3)) ++ show (nodez (cbal_tree 44)))