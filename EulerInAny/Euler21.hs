--Euler21
import Data.List

divisors :: Integer -> [Integer]
divisors x = [y | y <- [1..x-1] , x `rem` y == 0]

divSum :: Integer -> Integer
divSum x = sum (divisors x)

isAmicable :: Integer -> Bool
isAmicable x = divSum (divSum x) == x && (divSum x) /= x

testSpace = [1..10000]
possibles = Data.List.filter isAmicable testSpace

answer = sum possibles

main :: IO ()
main = putStrLn (show answer)