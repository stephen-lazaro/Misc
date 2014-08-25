%% @author Stephen Lazaro <stephen.lazaro@berkeley.edu>
%% @doc A small library of functions for lists. Most are already implemented in the lists module
%% @reference As seen in 99 Problems in Scheme (or OCaml, if you swing that way)
-module(liszt).
-export([lastr/1, pop2/1, penlast/1, penlastr/1, kthOf/2, len/1, reverse/1, palindrome/1, flattenr/1, compressr/1, packr/1, rler/1, mrler/1, derler/1, drler/1, dupe/1, dropr/2, splitr/2, slicer/3, rot/2, rem_at/2, insert_at/3, orangez/2, crangez/2]).

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

%Returns the kth element of a list (second argument is k, if you dig)
kthOf([], _)       -> none;
kthOf([Hd|_], 0)   -> Hd;
kthOf([_|Lz], Acc) -> kthOf(Lz, Acc - 1).

%Returns the length, tail recursive
lenaux([], Acc)     -> Acc;
lenaux([_|Lz], Acc) -> lenaux(Lz, Acc + 1).
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
compressaux([Hd|Lz], Acc, Flag) when Hd =:= Flag 
  -> compressaux(Lz, Acc, Flag);
compressaux([Hd|Lz], Acc, Flag) when Hd =/= Flag 
  -> compressaux(Lz, [Hd|Acc], Hd).
compressr([])      -> []; 
compressr([Hd|Lz]) -> compressaux(Lz, [Hd], Hd).

%Packs redundances into a sublist
packaux([], Tacc, Acc, _)
  -> reverse([Tacc|Acc]);
packaux([Hd|Lz], Tacc, Acc, Flag) when Hd =:= Flag 
  -> packaux(Lz, [Hd|Tacc], Acc, Flag);
packaux([Hd|Lz], Tacc, Acc, Flag) when Hd =/= Flag 
  -> packaux(Lz, [Hd], [Tacc|Acc], Hd).
packr([])      -> [];
packr([Hd|Lz]) -> packaux([Hd|Lz], [], [], Hd).

%Run length encoding of list (notice the second guard is strictly not necessary, but I include it to make the function self-documenting)
rlaux([], Tacc, Acc, Flag)
  -> reverse([[Acc + 1,Flag]|Tacc]);
rlaux([Hd|Lz], Tacc, Acc, Flag) when Hd =:= Flag 
  -> rlaux(Lz, Tacc, Acc + 1, Flag);
rlaux([Hd|Lz], Tacc, Acc, Flag) when Hd =/= Flag 
  -> rlaux(Lz, [[Acc + 1, Flag]|Tacc], 0, Hd).
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

%Direct solution to the run length encoding problem; instead of constructing lists count things
drleaux([], Flag, 1, Acc)
  -> reverse([Flag|Acc]);
drleaux([], Flag, Count, Acc)
  -> reverse([[Count, Flag]|Acc]);
drleaux([Hd|Lz], Flag, Count, Acc) when Hd =:= Flag 
  -> drleaux(Lz, Flag, Count + 1, Acc);
drleaux([Hd|Lz], Flag, 1, Acc)     when Hd =/= Flag 
  -> drleaux(Lz, Hd, 1, [Flag|Acc]);
drleaux([Hd|Lz], Flag, Count, Acc)                  
  -> drleaux(Lz, Hd, 1, [[Count, Flag]|Acc]).
drler([])      -> [];
drler([Hd|Lz]) -> drleaux([Hd|Lz], Hd, 0, []).

%Returns a list with every element duplicated
dupaux([])      -> [];
dupaux([Hd|Lz]) -> [Hd|[Hd|dupe(Lz)]].
dupe(Lz) -> dupaux(Lz).

%Drop every nth character of the list given
draux(_, _, [], Acc)      -> reverse(Acc);
draux(N, 1, [Hd|Lz], Acc) -> draux(N, N, Lz, [Hd|Acc]);
draux(N, M, [_|Lz], Acc)  -> draux(N, M-1, Lz, Acc). 
dropr(N, Lz) -> draux(N, N, Lz, []).

%Splits a list into two parts when the length of the first is given
splaux(Lz, 0, Acc)      -> {reverse(Acc), Lz};
splaux([Hd|Lz], N, Acc) -> splaux(Lz, N - 1, [Hd|Acc]).
splitr(Lz, N) -> splaux(Lz, N, []).

%Extracts a slice from a list.
slice_aux(_,_, _, [], Acc) -> reverse(Acc);
slice_aux(0, M, T, _, Acc) when M =:= T -> reverse(Acc);
slice_aux(0, M, T, [Hd|Lz], Acc)       -> slice_aux(0, M - 1, T, Lz, [Hd|Acc]);
slice_aux(N, M, T, [_|Lz], Acc)        -> slice_aux(N - 1, M, T, Lz, Acc).
slicer(N, M, Lz) -> slice_aux(N, M, N, Lz, []).

%Rotates a list n slices to the left.
rot(N, Lz) -> slicer(N rem len(Lz), len(Lz), Lz) ++ slicer(0, N rem len(Lz), Lz).

%Remove the nth element of a list, for now don't overindex.
rem_at(N, Lz) -> rem_at(N, Lz, []).
rem_at(0, [_|Lz], Acc) -> reverse(Acc) ++ Lz;
rem_at(_, [], Acc) -> Acc;
rem_at(N, [Hd|Lz], Acc) -> rem_at(N - 1, Lz, [Hd|Acc]).

%Insert an element into a given position; I let it fail when list is empty
insert_at(N, Elem, Lz) -> insert_at(N, Elem, Lz, []).
insert_at(0, Elem, Lz, Acc) -> reverse(Acc) ++ [Elem|Lz];
insert_at(N, Elem, [Hd|Lz], Acc) -> insert_at(N - 1, Elem, Lz, [Hd|Acc]).

%Returns a range noninclusive i.e. open
orangez(N, M) -> orangez(N, M, [], undef).
orangez(N, M, Acc, _) when N > M -> orangez(N - 1, M, [(N - 1)|Acc], down);
orangez(N, M, Acc, _) when N < M -> orangez(N + 1, M, [N|Acc], up);
orangez(_, _, Acc, down) -> reverse(Acc);
orangez(_, _, Acc, up)   -> reverse(Acc).

%Returns a range inclusive i.e. closed
crangez(N, M) when N < M -> orangez(N, M) ++ [M];
crangez(N, M) when N > M -> [N|orangez(N, M)];
crangez(N, _) -> [N].

%%% Skipping a bunch of randomized element stuff here
%%% We'll come back to it

% Generate all combinations of a given length of elements taken from the list
% First, a more general problem: generate all subsets
subsets Lz -> 