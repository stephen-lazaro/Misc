-module(sorts).
-export([quicksorts/1, mergesorts/1])

splith([], _) -> [];
splith(Lz, Acc, Loc) when (len(Lz) / 2) =:= Loc -> [[Acc|[]] | [splith(Lz, [], Loc + 1)]];
splith([Hd,Lz], Acc, Loc) -> splith(Lz, [Acc | Hd], Loc + 1).

splitpiv

quicksort(Lz) -> 