%% @author Stephen Lazaro <stephen.lazaro@berkeley.edu>
%% @doc Functions calculating the area of a rectangle.
%% @reference solution to <a href="http://www.github.com/oreillymedia/etudes-for-erlang/">Etudes for Erlang</a> Ch. 2,3
%% @copyright Stephen Lazaro 2014
%% @version 0.1

-module(geom).
-export([area/1]).

%%% Calculates the area of a rectangular figure given the width and height of said figure.
area(0,_) -> 0;
area(_,0) -> 0;
area(Height,Width) -> Height * Width.

%%% Pattern matches against shap tag, then decides what calculation to make. If tag isn't triangle or ellipse, we default to rectangle.
%%% Also calculates the area of a plane figure.
area(triangle, Base, Height) when Base >= 0, Height >=0                         -> area(Base, Height) div 2;
area(ellipse, RadiusMajor, RadiusMinor) when RadiusMajor >= 0, RadiusMinor >= 0 -> math:pi() * RadiusMajor * RadiusMinor;
area(_, X, Y) when X >= 0, Y >= 0                                               -> area(X, Y);
area(_, _, _) -> 0. %The question asks us to purposefully ignore the let it fail convention.

%%% A tuple parametrized wrapper for area/3. Takes an atom referring to a shape, then calculates its area using the other two fields.
area({Term, X, Y}) -> area(Term, X, Y);
area({_S, Term, X, Y}) -> area(_S, Term, X, Y).

%%%We are asked to rewrite area/3 to use a case. I'm going to write it as area/4 just so this'll all compile.
area(_, Term, X, Y) when X>= 0, Y>=0 ->
  case Term of
    triangle -> area(X, Y) div 2;
    ellipse  -> area(X, Y) * math:pi();
    _        -> area(X, Y)
  end;
area(_, _, _, _) -> 0.
