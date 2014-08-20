--Returns the last element of a list
last [] = nil
last Hd:[] = Hd
last Hd:Lz = last Lz

--Returns the last two elements of a list
last [] = []
last Hd:[] = [Hd]
last Hd:Hdd:[] = [Hd, Hdd]
last Hd:Lz = last Lz

--Returns the kth element of a list
at _ []    = False
at 0 Hd:_ = Hd
at N Hd:Lz = at (N - 1) Lz

--Returns the number of elements in a list
laux [] Acc    = Acc
laux Hd:Lz Acc = laux Lz (Acc + 1)
length Ls = laux Ls 0
