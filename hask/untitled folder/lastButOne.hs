lastButOne listical =
  if tail (tail listical) == []
  then head listical
  else lastButOne (tail listical)