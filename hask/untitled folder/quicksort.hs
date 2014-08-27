quicksort [] = []
quicksort (x:xs) = (quicksort left) ++ [x] ++ (quicksort right)
  where left = quicksort [y | y <- xs, y < x]
        right = quicksort [z | z <- xs, z >= x]

main = show (quicksort [4,2,3,5,7,6,1])