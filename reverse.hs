reversus [] = []
reversus (x:xs) = reversus xs :: (x :: acc)