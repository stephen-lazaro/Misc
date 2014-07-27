let reverse listical =
  let rec revaux acc = function
  |[] -> acc
  |hd :: tl -> revaux (hd :: acc) tl in revaux [] listical
;;
let palindrome listical =
  if reverse listical = listical then true else false
;;
let palindromeidio listical =
  reverse listical = listical
;;
(*The second is more OCaml idiomatic*)