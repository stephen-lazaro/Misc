penult listical =
  if null ( tail ( tail ( listical)))
  then head listical
  else penult ( tail listical)