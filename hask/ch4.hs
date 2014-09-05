--Chapter 4 Exercises
import Data.Char

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
errorCheck :: Char -> Char
errorCheck  x
	|isIn x ['0','1','2','3','4','5','6','7','8','9','-'] = id x
	|otherwise = error "That ain't no digit."
	where isIn x [] = False; 
		  isIn x (hd:lz)
		    |x /= hd   = isIn x lz
			|otherwise = True

asInt :: String -> Int
asInt ('-':lz) = (-1)*asInt lz
asInt lz = foldl (\x y -> 10*x + (fromChar y)) 0 lz
	where fromChar = digitToInt . errorCheck

--Primitive recursive version
asIntr :: String -> Int
asIntr ('-':lz) = (-1)*asIntr lz
asIntr lz = (foldr (\x y -> 10*y + (fromChar x)) 0 . reverse) lz
	where fromChar = digitToInt . errorCheck

--Catchable version!
{-
asInt_catchable :: String -> Either String Int
asInt_catchable lz = (foldl (\x y -> ((uncurry combin) (x, (makeInt y)))) 0) lz
	where combin acc ((Right hd):lz) = 10*acc + hd;
		  combin acc ((Left hd):lz)  = error hd;

		  makeInt x
		  |isIn x ['0','1','2','3','4','5','6','7','8','9','-'] = Right (digitToInt x)
		  |otherwise = Left "Oh shit"
		  where isIn x [] = False; 
		        isIn x (hd:lz)
		          |x /= hd   = isIn x lz
				  |otherwise = True
-}

--Primitive recursive concatenation function
concatFoldr :: [[a]] -> [a]
concatFoldr = foldr (\x y -> x ++ y) []

--Overly Clever Version of takeWhile
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile pred lz = measure (zip lz (map pred lz)) []
	where measure [] acc = reverse acc;
		  measure ((val, True):rst) acc = measure rst (val:acc);
		  measure ((_, False):rst) acc  = measure rst acc

--Explicitly Recursive Version of takeWhile
expTakeWhile :: (a -> Bool) -> [a] -> [a]
expTakeWhile pred lz = measure pred lz []
	where measure pred [] acc = reverse acc;
		  measure pred (hd:lz) acc
		  |pred hd == False = measure pred lz acc
		  |pred hd == True  = measure pred lz (hd:acc)

--Primitive Recursive Version of takeWhile
takeWhileFoldr :: (a -> Bool) -> [a] -> [a]
takeWhileFoldr pred lz = foldr (\x y -> if pred x then (x:y) else y) [] lz

--groupBy using a fold
