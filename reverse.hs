reversus f acc [] = []
reversus f acc (x:xs) = reversus f xs :: (x :: acc)