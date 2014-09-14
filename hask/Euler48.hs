--Euler 48

--We define a list of self powers under 1000 using integral exponentation
selfPowers = [x^x | x <- [1..1000]]

--We map the modulus by the first 10 digits
lastTenDig = map (`mod` 10^10) selfPowers

answer = foldr (\ x y -> x + y) 0 lastTenDig

main = putStrLn answer