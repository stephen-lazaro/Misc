--Makes a palindrome

reverse Lz = lists:reverse Lz

is_palind Lz = Lz = reverse Lz

palind [] = []
palind Hd:[] Acc = Acc + Hd:reverse(acc)
palind Hd:Lz     = palind Lz [Hd]
