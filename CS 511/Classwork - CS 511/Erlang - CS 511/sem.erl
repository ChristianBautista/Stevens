-module(sem).
-compile([start_sem/1,acquire/1,release/1]).

start_sem(Init) ->
    spawn(?MODULE,sem_loop,[Init]).

sem_loop(0) ->
    receive ->
        {release} ->
            sem_loop(1);
end;
sem_loop(P) when P>0 ->
    receive ->
        {release} ->
            sem_loop(P+1);
        {acquire,From} ->
            From!{ack},
            sem_loop(P-1)
end.

acquire(S) ->
    S!{acquire,self()},
    receive
        {ack} ->
            done
end.

release(S) ->
    S!{release}.

%% Example of a client using a semaphore CD only after AB

start() ->
    S = start_sem(0),
    spawn(?MODULE,client1,[S])

client1(S) ->
    io:format("a~n"),
    io:format("b~n"),
    release(S).

client2(S) ->
    acquire(S),
    io:format("c~n"),
    io:format("d~n").