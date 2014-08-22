let rec last list =
  match list with
  |[] -> failwith "Empty"
  |[a] -> a
  |hd :: list -> last list
;;