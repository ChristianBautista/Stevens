-module(gg).
-compile(export_all).

start() ->
    spawn(?MODULE,loop,[]).

client(S) ->
    R = make_ref(),
    S!{self(),R,start},
    receive
        {R,Servlet,ok} ->
            client_loop(Servlet,0)
end.

client_loop(Servlet,C) ->
    RN = rand:uniform(100),
    R = make_ref(),
    Servlet!{self(),R,RN,guess},
    receive
        {R,correct} ->
            io:format("~p guessed in ~p tries~n",[self(),C]);
        {R,incorrect} ->
            client_loop(Servlet,C+1)
end. 

loop() ->
    receive
        {From,Ref,start} ->
            S = spawn(?MODULE, servlet, [From,rand:uniform(100)]),
            From!{Ref,S,ok},
            loop()
end.

servlet(Client,N) ->
    receive
        {From,Ref,R,guess} when R==N ->
            From!{Ref,correct};
        {From,Ref,R,guess} when R/=N ->
            From!{Ref,incorrect},
            servlet(Client,N)
end.