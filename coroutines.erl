-module(coroutines).
-export([getNaturals/0]).

getNaturals() ->
  Pid = spawn(coroutines, naturals, [53]),
  Pid ! {self(), start},
  recieveNaturals(Pid).

recieveNaturals(Pid) ->
  receive
    {_, 0} -> io:format("~w~n", [0]);
    {Pid, N} -> io:format("~w~n", [N]), Pid ! next
  end.

naturals(N) ->
  receive
    {From, 0}    -> From ! {self(), 0};
    {From, next} -> From ! {self(), N}, naturals(N - 1)
  end.