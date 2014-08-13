-module(range).
-export([ranger/1]).

%returns list descending from the argument of numbers less than the argument.
%One would really want this list reversed but that's not hard so...
ranger(0) -> [0];
ranger(N) -> [N | ranger(N - 1)].