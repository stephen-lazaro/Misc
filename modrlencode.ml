type 'a rle =
  |One of 'a
  |Many of int * 'a
;;

let rlencode listical =
  let create_tuple cnt elem =
    if cnt = 1 then One elem
    else Many (cnt, elem)
  let rec aux count acc = function
    |[] -> []
    |[x] -> create_tuple (count + 1, x) :: acc 
    |x :: (y :: _ as t) = if x = y 
                          then aux (count + 1) t 
                          else aux 0 ((create_tuple (count + 1) x) :: acc) t
  in List.rev aux 0 [] listical