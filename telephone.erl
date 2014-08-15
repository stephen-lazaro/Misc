-module(telephone).
-export([telephone/0, telemid/0, telend/0]).

telephone() ->
  Pid = spawns(telephone, telemid, []),
  Pid ! {self(), hello}.

telemid() ->
  Pid = spawns(telephone, telemid, []),
  receive
    {From, hello} -> Pid ! heppo,
    {From, heppo} -> Pid ! happo,
    {From, happo} -> Pid ! hippo,
    {From, hippo} -> Spid = spawns(telephone, telend, [])
  end.

telend() ->
  true.