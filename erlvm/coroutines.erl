-module(coroutines).
-export([getNaturals/1, receiveNaturals/2, naturals/2, getFibs/1, receiveFibs/2, fibs/4]).

getNaturals(End) ->
  Pid = spawn(coroutines, naturals, [0, End]),
  Pid ! {self(), start},
  receiveNaturals(Pid, End),
  Pid ! stop.

receiveNaturals(Spid, M) ->
  receive
    {_, M}    -> io:format("~w~n", [M]), true;
    {Spid, N} -> io:format("~w~n", [N]), Spid ! {self(), next}, receiveNaturals(Spid, M)
  end.

naturals(Current, N) ->
  receive
    {From, start}-> From ! {self(), Current}, naturals(Current + 1, N);
    {From, next} -> From ! {self(), Current}, naturals(Current + 1, N);
    stop         -> true
  end.

getFibs(EndTerm) ->
  Pid = spawn(coroutines, fibs, [0, 1, EndTerm, 0]),
  Pid ! {self(), start},
  receiveFibs(Pid, EndTerm),
  Pid ! stop.

receiveFibs(Pid, EndTerm) ->
  receive
    {_, Final, EndTerm} -> io:format("~w~n", [Final]), true;
    {Pid, Current, _} -> io:format("~w~n", [Current]),
                               Pid ! {self(), next}, 
                               receiveFibs(Pid, EndTerm)
  end.

fibs(Previous, Current, EndTerm, TermNumber) ->
  receive
    {From, start} -> From ! {self(), Previous, TermNumber},
                     fibs(Current, Previous + Current, EndTerm, TermNumber + 1);
    {From, next}  -> From ! {self(), Previous, TermNumber},
                     fibs(Current, Previous + Current, EndTerm, TermNumber + 1);
    stop -> true
  end.
