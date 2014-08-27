module Liszt where

--For many of these we use the Maybe data type for safety.
--Returns the last element of a list
lastr :: [Maybe a] -> Maybe a
lastr [] = Nothing
lastr (Just hd:[]) = Just hd
lastr (Just hd:lz) = lastr lz

--Returns the last two elements of a list
penlast :: [a] -> [a]
penlast [] = []
penlast (hd:[]) = [hd]
penlast (hd:(hdd:[])) = [hd, hdd]
penlast (hd:lz) = penlast lz

--Returns the kth element of a list
at :: Integer -> [Maybe a] -> Maybe a
at _ []    = Nothing
at 0 (Just hd:_) = Just hd
at n (Just hd:lz) = at (n - 1) lz

--Returns the number of elements in a list
len :: [a] -> Integer 
laux [] acc    = acc
laux (hd:lz) acc = laux lz (acc + 1)
len ls = laux ls 0

--Reverses a list
reversus :: [a] -> [a]
reversus (hd:lz) = let rev (f:rst) acc = rev rst (acc ++ [f]);
					   rev [] acc = acc
  	                in rev (hd:lz) []

--Palindrome test
palind :: [Int] -> Bool
palind lz = paux lz (reverse lz) True
    where paux [] [] acc = acc;
    	  paux [] _ acc = False;
    	  paux _ [] acc = False;
          paux (hd : lz) (f:other) acc = paux lz other (hd == f)

--