-module(echo).
-export([go/0, loop/0]).

go() ->
  Pid = spawn(echo, loop, []),
  Pid ! {self(), hello},
  receiveEcho(Pid),
  Pid ! stop.

receiveEcho(Pid) ->
  receive
    {Pid, Msg} -> io:format("~w~n", [Msg])
  end.

loop() ->
  receive
    {From, Msg} ->
      From ! {self(), Msg},
      loop();
    stop -> 
      true
end.