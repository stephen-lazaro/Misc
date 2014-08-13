-module(sorting).
-export([quicksorts/1, mergesorts/1]).

%len([]) -> 0;
%len([Hd|Lz]) -> 1 + len(Lz).

quicksorts([])                 -> [];
quicksorts([[Left], [Right]])  -> [quicksorts(Left) | quicksorts(Right)];
quicksorts([Hd|Lz])            -> quicksorts([X||X <- Lz, X =< Hd]) ++ [Hd] ++ quicksorts([Y||Y <- Lz, Y > Hd]). 


mergesorts([])      -> [];
mergesorts([Right,Left]) -> mergesorts(Right) ++ mergesorts(Left);
mergesorts([Hd|Lz]) -> mergesorts(lists:split(lists:length([Hd|Lz]) div 2, [Hd|Lz])).
