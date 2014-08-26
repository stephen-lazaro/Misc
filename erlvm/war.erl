%Chapter 8 Exercises Erlang
%% @author Stephen Lazaro <stephen.lazaro@berkeley.edu>
%% @doc A module to simulate a card game using processes
%% @copyright Stephen Lazaro August 2014
%% Not that anyone would want it anyway.

-module(war).
-export([]).

startGame() -> Player1 = spawns(war, player, []),
               Player2 = spawns(war, player, []),
               beDealer().

beDealer() -> register(self(), dealer),
  receive

player(Other) ->
  receive
    {OtherPlayer, start, Cards} -> play(OtherPlayer, Cards)
  end

play(OtherPlayer, []) -> dealer ! lose, OtherPlayer ! lose.
play(OtherPlayer, [Hd|Hand]) -> dealer ! Hd, OtherPlayer ! Hd.
