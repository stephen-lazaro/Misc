main = interact wordCount
     where wordCount input = show (map ( length (words input))) ++ "\n"