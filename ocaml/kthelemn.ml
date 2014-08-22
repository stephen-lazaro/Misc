let rec at loc =
  function
  |[] -> None
  |h :: t -> if loc = 1 then Some h else at (loc - 1) t
;; 
(*This is a function that takes a list and traverses it*)
(* Note this recursively calls itself as it pops an item off the list and subtracts 1 off the location as we move forward*)