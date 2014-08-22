let reverse listical =
  let rec revaux acc = function
  |[] -> acc
  |hd :: tl -> revaux (hd :: acc) tl in revaux [] listical
;;
(*What we're doing here is we're pulling the first item slapping it into our accummulation then calling revaux with that list ?? *)