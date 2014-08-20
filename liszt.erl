%%% As seen in 99 Problems in Scheme (or OCaml, if you swing that way)
-module(liszt).
-export([lastr/1, pop2/1, penlast/1, penlastr/1, kthOf/2, len/1, reverse/1, palindrome/1, flattenr/1, compressr/1, packr/1, rler/1, mrler/1, derler/1]).

%Get's the last element of the list
lastr([A])    -> A;
lastr([_|Lz]) -> lastr(Lz);
lastr([])     -> [].

%Pops off the second element of the list!
%I was surprised by the outcome of this code at first. I was trying to write penlast/1!
pop2([A|[_|Lz]]) -> [A|Lz];
pop2([_|Lz])     -> penlastr(Lz);
pop2([])         -> [].

%Returns the penultimate element of the list
penlast([])     -> [];
penlast([A])    -> [A];
penlast([A, _]) -> A;
penlast([_|Lz]) -> penlast(Lz).

%Returns the list of the penultimate and last elements of the given list
penlastr([])     -> [];
penlastr([A])    -> [A];
penlastr([A, B]) -> [A,B];
penlastr([_|Lz]) -> penlastr(Lz).

%Returns the kth element of a list
kthOf([], _)       -> none;
kthOf([Hd|_], 0)   -> Hd;
kthOf([_|Lz], Acc) -> kthOf(Lz, Acc - 1).

%Returns the length, tail recursive
lenaux([], Acc)     -> Acc;
lenaux([_,Lz], Acc) -> lenaux(Lz, Acc + 1).
len(Lz)             -> lenaux(Lz, 0).

%Reverses the given list!
reversus([], Acc)      -> Acc;
reversus([Hd|Lz], Acc) -> reversus(Lz, [Hd|Acc]).
reverse(Lz)            -> reversus(Lz, []).

%Tests whether is palindrome
palindrome(Lz) ->
  reverse(Lz) =:= Lz.

%Flattens a nested list
flattenr([]) -> [];
flattenr([Hd,_]) -> flattenr(Hd).
%The above needs work, some way of combining results

%Removes redundancies in a lsit
compressaux([], Acc, _) -> reverse(Acc);
compressaux([Hd|Lz], Acc, Flag) when Hd =:= Flag -> compressaux(Lz, Acc, Flag);
compressaux([Hd|Lz], Acc, Flag) when Hd =/= Flag -> compressaux(Lz, [Hd|Acc], Hd).
compressr([])      -> []; 
compressr([Hd|Lz]) -> compressaux(Lz, [Hd], Hd).

%Packs redundances into a sublist
packaux([], Tacc, Acc, _)                          -> reverse([Tacc|Acc]);
packaux([Hd|Lz], Tacc, Acc, Flag) when Hd =:= Flag -> packaux(Lz, [Hd|Tacc], Acc, Flag);
packaux([Hd|Lz], Tacc, Acc, Flag) when Hd =/= Flag -> packaux(Lz, [Hd], [Tacc|Acc], Hd).
packr([])      -> [];
packr([Hd|Lz]) -> packaux([Hd|Lz], [], [], Hd).

%Run length encoding of list
rlaux([], Tacc, Acc, Flag)                       -> reverse([[Acc + 1,Flag]|Tacc]);
rlaux([Hd|Lz], Tacc, Acc, Flag) when Hd =:= Flag -> rlaux(Lz, Tacc, Acc + 1, Flag);
rlaux([Hd|Lz], Tacc, Acc, Flag) when Hd =/= Flag -> rlaux(Lz, [[Acc + 1, Flag]|Tacc], 0, Hd).
rler([])      -> [];
rler([Hd|Lz]) -> rlaux([Hd|Lz], [], -1, Hd).

%Modified run length encoding (Note this is certainly not the most efficient solution)
mrlaux([], Acc)         -> reverse(Acc);
mrlaux([[1,B]|Lz], Acc) -> mrlaux(Lz, [B|Acc]);
mrlaux([Hd|Lz], Acc)    -> mrlaux(Lz, [Hd|Acc]).
mrler(Lz) -> mrlaux(rler(Lz), []).

%Decodes a run-lenth encoded list.
derlaux([], Acc)         -> reverse(Acc);
derlaux([[1,B]|Lz], Acc) -> derlaux(Lz, [B|Acc]);
derlaux([[A,B]|Lz], Acc) -> derlaux([[A-1,B]|Lz],[B|Acc]).
derler(Lz) -> derlaux(Lz, []).

%Direct solution to the run length encoding problem; instead of constructinhg lists count things
drleaux([], Flag, Count, Acc) -> reverse([[Count, Flag]|Acc]);
drleaux([Hd|Lz], Flag, Count, Acc) when Hd =:= Flag -> drleaux(Lz, Flag, Count + 1, Acc);
drleaux([Hd|Lz], Flag, Count, Acc) when Hd =/= Flag, Count =:= 1 -> drleaux(Lz, Hd, 1, [Flag]|Acc];
drleaux([Hd|Lz], Flag, Count, Acc) when Hd =/= Flag, Count =/= 1 -> drleaux(Lz, Hd, 1, [[Count, Flag]|Acc].
drler([])      -> [];
drler([Hd|Lz]) -> drelaux([Hd|Lz], Hd, 0, []).

%
