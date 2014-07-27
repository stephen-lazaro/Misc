type 'a node=
  |One of 'a
  |Many of 'a node list
;;
(*A type with two options, either a node is flat or it is a list*)

let flatten listical =
  function flataux acc =
  |[] -> acc
  |a :: listical -> if a is One of 'a then a :: acc else flautaux (a :: acc)
(*Better to write this with an accumulation?? Something in the second line looks bad, we won't traverse all the list probably stopping at the first flat node*)