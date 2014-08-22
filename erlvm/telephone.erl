-module(telephone).
-export([telephone/0, telemid/0, telend/0]).

%The idea here is simple. We make processes play telephone!
%There is a starting player, the generating process (say the shell).
%There are five players in the circle! Three of them slip a vowel (totally normal right?).
%The last one doesn't hear anything and all he says is whaaaa?
%Just an experiment in making data flow across processes.

telephone() ->
  Pid = spawn(telephone, telemid, []),
  Pid ! hello, io:format("I say: ~w~n", [hello]).

telemid() ->
  receive
    hello -> Pid = spawn(telephone, telemid, []), Pid ! heppo, io:format("I heard: ~w~n", [heppo]);
    heppo -> Pid = spawn(telephone, telemid, []), Pid ! happo, io:format("I heard: ~w~n", [happo]);
    happo -> Pid = spawn(telephone, telemid, []), Pid ! hippo, io:format("I heard: ~w~n", [hippo]);
    hippo -> Spid = spawn(telephone, telend, []), Spid ! hippa
  end.

telend() ->
  io:format("~w\?~n", [qua]).