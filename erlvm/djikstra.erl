%% @author Stephen Lazaro <stephen.lazaro@gmail.com>
%% @doc Defines a recursive function for calculating the greatest common divisor a la Djikstra
%% @reference Solution to Etudes for Erlang 4-2


-module(djikstra).
-export([gcd/2, gcd/3]).

%%This uses multiple clauses with guards to implement the algorithm
gcd(M, N) when M==N -> M;
gcd(M, N) when M>N  -> gcd(M - N, N);
gcd(M, N) when M<N  -> gcd(M, N - M).

%It is suggested we use a cond statement. We implement sgn for ease.
sgn(X) when X < 0  -> -1;
sgn(X) when X > 0  -> 1;
sgn(X) when X == 0 -> 0.

gcd(_, M, N) ->
  case sgn(M-N) of
    0  -> M;
    -1 -> gcd(M, N-M);
    1  -> gcd(M-N, N)
  end.
