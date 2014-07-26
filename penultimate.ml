let rec penult listical =
  match listical with
  |[] -> failwith "Empty"
  |[a] -> a
  |[c, d] -> c
  |q :: listical -> penult listical
;;