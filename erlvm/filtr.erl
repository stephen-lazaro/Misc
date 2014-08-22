-module(filtr).
-export([filtr/2]).

filtr([], _) -> [];
filtr([Hd|Lz], N) when Hd =< N -> [Hd | filtr(Lz, N)];
filtr([_|Lz], N) -> filtr(Lz, N).