--Meant to join a list of lists using the given separator

--function overloading is really cool
intersperse [] sep = []
intersperse [] _ acc      = reverse(acc)
intersperse hd:lz sep acc = intersperse lz sep (acc ++ [sep] ++ hd)
intersperse hd:lz sep     = intersperse lz sep sep:hd
