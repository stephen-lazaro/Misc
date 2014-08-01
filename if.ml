let ifs condi truf fails = function
  |True x _ -> x
  |False _ y -> y