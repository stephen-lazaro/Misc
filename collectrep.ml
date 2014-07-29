let collectrep listical =
  let rec crepaux current acc = function
    |[] -> [] (*Only if original list is empty *)
    |[x] -> (x :: current) :: acc
    |a :: (b :: listical) -> if a = b
                            then crepaux (a :: current) acc listical
                            else crepaux [] ((a :: current) :: acc) listical in
                               List.rev (crepaux [] [] listical) 
;;

collectrep ["a";"a";"b";"c";"c";"c";"d";"e";"e";"e";"e"]