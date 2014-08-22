--This sorts a list of lists by list length
--This could be easily optimized by randomly choosing a pivot at each quicksortList call.

length []    acc = acc
length hd:lz acc = length lz (acc + 1)
length hd:lz = length Lz 1

quicksortList [] = []
quicksortList pivot:lz = [x | x <- Lz, (length x) < (len)]
                      + [pivot]
                      + [y | y <- Lz, (length y) < (len)]
    where len = length pivot
