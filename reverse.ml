let fac reverse listical =
  match listical with
  |[] -> []
  |hd :: listical -> (reverse listical) @ [hd]
(* One should also write a tail recursive version of same*)