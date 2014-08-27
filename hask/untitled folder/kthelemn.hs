at acc listical =
  if acc == 1
  then head listical
  else at (acc - 1) (tail listical)
--What I am trying to do is parametrize a function by the list that recurses through and returns the length

main = interact atFive
  where atFive input = show(at 5 input)