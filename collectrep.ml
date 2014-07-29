let collectrep listical =
  let rec crepaux acc =
    |a :: (b :: listical) -> if a = b then crepaux (a :: acc) listical else acc :: crepaux [] listical
    |[] -> []
;;