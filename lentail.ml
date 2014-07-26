let len listical =
  let rec lenaux n = function
  |[] -> n
  |hd :: listical -> lenaux (n + 1) listical
  in lenaux 0 listical
;;