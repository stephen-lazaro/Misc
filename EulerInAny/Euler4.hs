import Control.Applicative
import Data.List

getAnswer :: [Integer]
getAnswer = (*) <$> [100..999] <*> [100..999]

isPalind :: (Eq a) => [a] -> Bool
isPalind lz = lz == Data.List.reverse lz

explode :: Integer -> [Integer]
explode x = explodr x []
    where explodr m acc
              | m <= 0 = acc
              | m < 10 = m : acc
              | otherwise = explodr (m `div` 10) ((m `rem` 10) : acc)

makeNum :: [Integer] -> Integer
makeNum = foldl (\x y-> x * 10 + y) 0

further :: Integer
further = foldl max 0 $ map makeNum $ filter isPalind $ map explode getAnswer

main = print further