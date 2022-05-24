-module(barr).
-compile(export_all).

start() ->
    B = spawn(?MODULE,loop,[2,2,[]]),
    spawn(?MODULE,client1,[B]),
    spawn(?MODULE,client2,[B]),
    ok.

% N is the size of the barrier
% M is the number of threads yet to arrive at the barrier
% L is a list of PID, Ref of all those threads that have already arrived
loop(N,0,L) -> %% all threads have arrived, notify them
    [PID!{ok,Ref} || {PID,Ref} <- L],
    loop(N,N,[]);
loop(N,M,L) -> %% wait for next thread and then store its PID & Ref in L
    receive ->
        {From,Ref} -> loop(N,M-1,[{From,Ref}|L])
    end.
reached(B) ->
    R = make_ref(),
    B!{self(),R},
    receive
        {ok,R} -> ok
end.
client1(B) ->
    io:format("a~n"),
    reached(B),
    io:format("1~n").
client2(B) ->
    io:format("b~n"),
    reached(B),
    io:format("2~n").