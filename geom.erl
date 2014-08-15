%% @author Stephen Lazaro <stephen.lazaro@berkeley.edu>
%% @doc Functions calculating the area of a rectangle.
%% @reference solution to <a href="http://www.github.com/oreillymedia/etudes-for-erlang/">Etudes for Erlang</a>
%% @copyright Stephen Lazaro 2014
%% @version 0.1

-module(geom).
-export([area/2]).

%%% Calculates the area of a rectangular figure given the width and height of said figure.
area(0,_) -> 0;
area(_,0) -> 0;
area(Height,Width) -> Height * Width.
