len listical =
  lenaux 0 listical =
    if null listical
    then acc
    else lenaux (acc + 1) listical