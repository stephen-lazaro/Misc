laster listical = 
  if null (tail listical) 
  then (head listical) 
  else laster (tail listical)

main = interact lastof
  where lastof input = show (laster (input)) ++ "\n"