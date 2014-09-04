--Chapter 4 Exercises

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith pred lz =
	let aux pred [] (z:tmp) acc = reverse ((z:tmp):acc);
		aux pred []	 [] acc = reverse acc;
		aux pred (hd:lz) (z:tmp) acc
			|(pred hd) == True  = aux pred lz ((z:tmp) ++ [hd]) acc
			|(pred hd) == False = aux pred lz [] (((z:tmp) ++ [hd]):acc);
		aux pred (hd:lz) [] acc = aux pred lz [hd] acc
	in aux pred lz [] []

--That was sort of a doozy!
--My Haskell code is so ugly compared to other peoples' :(
