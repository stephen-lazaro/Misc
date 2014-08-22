--Returns the last element of a list
lastr [] = False
lastr (hd:[]) = hd
lastr (hd:lz) = lastr lz

--Returns the last two elements of a list
penlast [] = []
penlast (hd:[]) = [hd]
penlast (hd:(hdd:[])) = [hd, hdd]
penlast (hd:lz) = penlast lz

--Returns the kth element of a list
at _ []    = False
at 0 (hd:_) = hd
at n (hd:lz) = at (n - 1) lz

--Returns the number of elements in a list
laux [] acc    = acc
laux (hd:lz) acc = laux lz (acc + 1)
length ls = laux ls 0

--