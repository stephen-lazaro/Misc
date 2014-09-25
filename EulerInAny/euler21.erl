-module(euler21).
-export([answer/0, testSpace/0, possibles/0, isAmicable/1]).
% That sure took longer than anticipated.

divisors(X) -> [Y || Y <- lists:seq(1,X-1), X rem Y ==0].

div_sum(X) -> lists:sum(divisors(X)).

isAmicable(X) -> (div_sum(div_sum(X)) =:= X) and ((div_sum(X)) =/= X).

testSpace() -> lists:seq(5,10000).
possibles() -> lists:filter((fun(X) -> isAmicable(X) end), testSpace()).

answer() -> lists:sum(possibles()).