let rec destutter = function
  |a :: (b :: _ as t) -> if a = b then destutter t else a :: destutter t
  |s -> s
;;
(* We pull two off our given list. If they are the same, we just move on. Else we keep it and move on. If it's just a value, we return it (suppose s is empty!) *)