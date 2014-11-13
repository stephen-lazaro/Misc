N = [1..]

--Clarifying utility
for = flip map

--Construct a list of remainders for each divisor
rem_lz = for N $ \y -> (y `rem`) <$> [2..20]

--Check if they are all 0
is_divis = foldl (\y -> y && x == 0) true

--Searching for the first all divis
answer = getr rem_lz
    where getr a:rst = if is_divis a then a else getr rst
    --??????????