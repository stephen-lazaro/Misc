let rec listSum listical =
  match listical with
  |[] -> 0
  |x :: listical -> x + listSum listical
;;
listSum [1;3;5;7;9];;