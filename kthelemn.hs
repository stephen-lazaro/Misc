at listical =
  ataux acc =
  if acc = 1
  then head listical
  else ataux (acc - 1) (tail listical)
--What I am trying to do is parametrize a function by the list that recurses through and returns the length