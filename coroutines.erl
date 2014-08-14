-module(coroutines).
-export([getNaturals/0, receiveNaturals/1, naturals/1]).

getNaturals() ->
  Pid = spawn(coroutines, naturals, [53]),
  Pid ! {self(), start},
  receiveNaturals(Pid),
  Pid ! stop.

receiveNaturals(Spid) ->
  receive
    {_, 0}    -> io:format("~w~n", [0]);
    {Spid, N} -> io:format("~w~n", [N]), Spid ! next, receiveNaturals(Spid)
  end.

naturals(N) ->
  receive
    {From, start}-> From ! {self(), N}, naturals(N - 1);
    {From, 0}    -> From ! {self(), 0};
    {From, next} -> From ! {self(), N}, naturals(N - 1);
    stop         -> true
  end.