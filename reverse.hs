reversus [] acc = acc
reversus (x:xs) acc = reversus xs (x : acc)