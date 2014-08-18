%%% As seen in 99 Problems in Scheme (or OCaml, if you swing that way)
-module(liszt).
-export([lastr/1, pop2/1, penlast/1, penlastr/1, kthOf/2, len/1, reverse/1, palindrome/1, flattenr/1, compressr/1, packr/1]).

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
compressaux([], Acc, _) -> Acc;
compressaux([Hd|Lz], Acc, Flag) when Hd =:= Flag -> compressaux(Lz, Acc, Flag);
compressaux([Hd|Lz], Acc, Flag) when Hd =/= Flag -> compressaux(Lz, [Hd|Acc], Hd).
compressr([])      -> []; 
compressr([Hd|Lz]) -> compressaux(Lz, [Hd], Hd).

%Packs redundances into a sublist
packaux([], Tacc, Acc, _)                          -> [Tacc|Acc];
packaux([Hd|Lz], Tacc, Acc, Flag) when Hd =:= Flag -> packaux(Lz, [Hd|Tacc], Acc, Flag);
packaux([Hd|Lz], Tacc, Acc, Flag) when Hd =/= Flag -> packaux(Lz, [Hd], [Tacc|Acc], Hd).
packr([])      -> [];
packr([Hd|Lz]) -> packaux([Hd|Lz], [], [], Hd).

%