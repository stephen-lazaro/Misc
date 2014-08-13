-module(sorting).
-export([quicksorts/1, mergesorts/1]).

quicksorts([])                 -> [];
quicksorts([[Left], [Right]])  -> [quicksorts(Left) | quicksorts(Right)];
quicksorts([Hd|Lz])            -> quicksorts([X||X <- Lz, X =< Hd]) ++ [Hd] ++ quicksorts([Y||Y <- Lz, Y > Hd]). 

mergesorts([])           -> [];
mergesorts({Left,Right}) -> mergesorts(lists:split(length(Left) div 2, Left)) ++ mergesorts(lists:split(length(Right) div 2, Right));
mergesorts(Lz)           -> mergesorts(lists:split(length(Lz) div 2, Lz)).
