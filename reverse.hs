reverse listical =
  let reversus =
    reversus [] acc = acc
    reversus (x:xs) acc = reversus xs (x : acc)
  in reversus listical []
