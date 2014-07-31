
flattus listical acc =
  [] = acc
  (x:xs)
    |Just x = flattus xs (x : acc)
    |otherwise = flattus (x)