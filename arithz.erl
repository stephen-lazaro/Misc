% Arithmetic problems as seen in 99 Problems Solved in Lisp (or OCaml).
-module(arithz).
-export([gcd/2, coprime/2, phi/1, euclid/2]).

%Finds greatest common divisor using djikstra's method
gcd(N, M) when N =:= M -> N;
gcd(N, M) when N > M   -> gcd(N - M, M);
gcd(N, M) when N < M   -> gcd(N, M - N).

%Finds greatest common divisor using euclid's method
euclid(X, 1) -> X;
euclid(X, 0) -> X;
euclid(0, _) -> 0;
euclid(X, Y) -> euclid(Y, X rem Y).

%Coprime test
coprime(N, M) -> gcd(N,M) =:= 1.

%Euler totient function, and auxiliary stuff.
binval(true) -> 1;
binval(false)-> 0.

coprime_num(X, Y) -> binval(coprime(X, Y)).

phaux(_, 0, Acc) -> Acc + 1;
phaux(N, M, Acc) -> phaux(N, M - 1, Acc + coprime_num(M,N)).
phi(N) -> phaux(N, N, 0).

