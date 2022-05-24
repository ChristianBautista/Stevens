-module(gs).
-compile(export-all).

start(F) ->
    spawn(?MODULE, loop, [F,0]).

loop(F,State) ->
    receive
        {req,From,Input} ->