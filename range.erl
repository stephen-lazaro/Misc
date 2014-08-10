-module(range).
-export([ranger/1]).

ranger(0) -> [0];
ranger(N) -> [N | ranger(N - 1)].