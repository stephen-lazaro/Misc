--Euler 36
--Numbers palindromic in binary and in decimal
import Data.List

intToDigits :: Integer -> [Integer]
intToDigits 0 = [0]
intToDigits x = aux x []
	where aux 0 acc = acc;
		  aux x acc = aux (x `div` 10) ((x `mod` 10) : acc)

palindromic lz =
	lz == Data.List.reverse lz

intToBinDigits :: Integer -> [Integer]
intToBinDigits 0 = [0]
intToBinDigits x = aux x []
	where aux 0 acc = acc;
		  aux x acc = aux (x `div` 2) ((x `mod` 2) : acc)

isVariPalindromic x = 
	(palindromic (intToDigits x)) && (palindromic (intToBinDigits x))

