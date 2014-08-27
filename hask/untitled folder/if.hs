if :: Bool -> a -> a -> a
if condition truf fails =
   |True x _ = x
   |False _ y = y