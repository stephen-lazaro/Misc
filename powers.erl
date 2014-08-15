-module(powers).
-export([raise/2]).

raise(_, 0)                             -> 1;
raise(_S, 1)                            -> _S;
raise(Base, Exponent) when Exponent > 0 -> Base * Raise(Base, Exponent - 1);
raise(Base, Exponent) when Exponent < 0 -> 1.0 / raise(Base, -Exponent);

%An accumulating version
raise(_, 0, Acc)       -> Acc;
raise(_S, 1, Acc)      -> Acc *_S;
raise
