type 'a node=
  |One of 'a
  |Many of 'a node list
;;
(*A type with two options, either a node is flat or it is a list*)
(*This is a variant type roaming over two differnt options, either one type, or a list of same type*)

let flatten listical =
  let rec flataux acc = function
  |[] -> acc
  |One hd :: listical -> flataux (hd :: acc) listical
  |Many hd :: listical -> flataux (flataux acc hd) listical in 
  List.rev (flataux [] listical)
;;
(*Strategy: Parametrize a function by a list. This function accumulates across the list. If the list the parametrized function is passed is empty, we return the accumulation it's been passed. If the first element is a single node we add the first item to the accumulation and proceed. If the first item is Many then we flatten that item and proceed across the list. Then, we reverse the end result.*)