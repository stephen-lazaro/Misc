--Exercises to Chapter 3
import Data.List
import Data.Ord
import Data.Function

len :: [a] -> Integer
len [] = 0
len (hd:lz) = 1 + len lz

sumz :: [Rational] -> Rational
sumz lz = sumer lz 0 where
	sumer [] acc = acc
	sumer (hd:lz) acc = sumer lz (hd + acc)

mean :: [Rational] -> Rational
mean lz = (sumz lz) / (fromIntegral (len lz))

palindMake :: [a] -> [a]
palindMake lz = lz ++ afterPivot lz [] where
	afterPivot (hd:[]) acc = acc
	afterPivot (hd:lz) acc = afterPivot lz (hd:acc)

palindrome :: (Eq a) => [a] -> Bool
palindrome lz = 
	let reversus [] acc = acc;
		reversus (hd:lz) acc = reversus lz (hd:acc) in
	lz == reversus lz []

lenSort :: [[a]] -> [[a]]
lenSort lz = Data.List.sortBy (compare `on` len) lz

interspersal :: a -> [[a]] -> [a]
interspersal item lz = 
	let sperse item [] acc = acc;
		sperse item (hd:lz) acc = sperse item lz (acc ++ [item] ++ hd)
	in sperse item lz []

data Tree a = Node a (Tree a) (Tree a)
			  |Empty
			  deriving (Show)

maxOf :: [Integer] -> Integer
maxOf lz = maxis lz 0 where
	maxis [] acc = acc;
	maxis (hd:lz) acc
		|hd > acc = maxis lz hd;
	maxis (hd:lz) acc = maxis lz acc

height :: Tree a -> Integer
height Empty = 0
height (Node _ left right) = 1 + maxOf([height left, height right])