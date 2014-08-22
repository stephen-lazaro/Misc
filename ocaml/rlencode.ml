let rlencode listical =
  let rec encaux count acc = function
  |[] -> []
  |[x] -> (count + 1, x) :: acc
  |a :: (b :: _ as t) ->
    if a = b then encaux (count + 1) acc t
    else encaux 0 ((count, a) :: acc) t in
  List.rev (encaux 0 [] listical)
;;