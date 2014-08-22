-module(sum).
-export([sumer/1, sumer/2]).

sumer(0) -> 0;
sumer(N) ->
  N + sumer(N - 1).

sumer(N, M) when N =< M -> sumer(M) - sumer(N) + N.