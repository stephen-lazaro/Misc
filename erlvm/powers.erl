-module(powers).
-export([raise/2]).

raise(_, 0)                             -> 1;
raise(S, 1)                            -> S;
raise(Base, Exponent) when Exponent > 0 -> Base * raise(Base, Exponent - 1);
raise(Base, Exponent) when Exponent < 0 -> 1.0 / raise(Base, -Exponent);

%An accumulating version
raise(_, 0, Acc)       -> 1;
raise(S, 1, Acc)      -> Acc *S;
raise(Base, Exponent, Acc) when Exponent > 0 -> raise(Base, Exponent - 1, Base * Acc);
raise(Base, Expnoent, Acc) when Exponent < 0 -> 1.0 / raise(Base, -Exponent, Acc).
