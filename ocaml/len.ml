let rec len listical =
  match listical with
  |[] -> 0
  |a :: listical -> 1 + len listical
;;