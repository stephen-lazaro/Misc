-module(sorts).
-export([quicksorts/1, mergesorts/1]).

len([]) -> 0;
len([Hd|Lz]) -> 1 + len(Lz).

splith([], _, _) -> [];
splith(Lz, Acc, Loc) when (len(Lz) / 2) =:= Loc -> [[Acc|[]] | [Lz]];
splith([Hd,Lz], Acc, Loc) -> splith(Lz, [Acc | Hd], Loc + 1).

splitpiv(Left, Right, _, [])                           -> [[Left] | [Right]];
splitpiv(Left, Right, Pivot, [Hd|Lz]) when Hd > Pivot  -> splitpiv(Left, [Hd | Right], Pivot, Lz);
splitpiv(Left, Right, Pivot, [Hd|Lz]) when Hd =< Pivot -> splitpiv([Hd | Left], Right, Pivot, Lz).

quicksorts([])                 -> [];
%quicksorts([A, B]) when A =< B -> [A, B];
%quicksorts([A, B]) when A > B  -> [B, A];
quicksorts([[Left], [Right]])  -> [quicksorts(Left) | quicksorts(Right)];
quicksorts([Hd|Lz])            -> quicksorts(splitpiv([], [], Hd, Lz)). 

mergesorts([])      -> [];
mergesorts([[Left], [Right]]) -> [mergesorts(Left) | mergesorts(Right)];
mergesorts([Hd|Lz]) -> mergesorts(splith(Lz, [Hd|[]], 1).