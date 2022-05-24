% Ankit Patel & Christian Bautista
% CS 511 HW4: Due 12/1/21
% I pledge my honor that I have abided by the Stevens Honor System.
-module(chatroom).

-include_lib("./defs.hrl").

-export([start_chatroom/1]).

-spec start_chatroom(_ChatName) -> _.
-spec loop(_State) -> _.
-spec do_register(_State, _Ref, _ClientPID, _ClientNick) -> _NewState.
-spec do_unregister(_State, _ClientPID) -> _NewState.
-spec do_update_nick(_State, _ClientPID, _NewNick) -> _NewState.
-spec do_propegate_message(_State, _Ref, _ClientPID, _Message) -> _NewState.

start_chatroom(ChatName) ->
    loop(#chat_st{name = ChatName,
		  registrations = maps:new(), history = []}),
    ok.

loop(State) ->
    NewState =
	receive
	    %% Server tells this chatroom to register a client
	    {_ServerPID, Ref, register, ClientPID, ClientNick} ->
		do_register(State, Ref, ClientPID, ClientNick);
	    %% Server tells this chatroom to unregister a client
	    {_ServerPID, _Ref, unregister, ClientPID} ->
		do_unregister(State, ClientPID);
	    %% Server tells this chatroom to update the nickname for a certain client
	    {_ServerPID, _Ref, update_nick, ClientPID, NewNick} ->
		do_update_nick(State, ClientPID, NewNick);
	    %% Client sends a new message to the chatroom, and the chatroom must
	    %% propegate to other registered clients
	    {ClientPID, Ref, message, Message} ->
		do_propegate_message(State, Ref, ClientPID, Message);
	    {TEST_PID, get_state} ->
		TEST_PID!{get_state, State},
		loop(State)
end,
    loop(NewState).

%% This function should register a new client to this chatroom
do_register(State, Ref, ClientPID, ClientNick) ->
	% /join #chat step 8

	% Original Modified
	% NewState = setelement(#chat_st.registrations, State, maps:put(ClientPID, ClientNick, State#chat_st.registrations)),
	% ClientPID ! {self(), Ref, connect, State#chat_st.history},
    % NewState.

	% New Version
	ClientPID!{self(), Ref, connect, State#chat_st.history},
	#chat_st {
		name = State#chat_st.name,
		registrations = maps:put(ClientPID, ClientNick, State#chat_st.registrations),
		history = State#chat_st.history
	}.

%% This function should unregister a client from this chatroom
do_unregister(State, ClientPID) ->
	% /leave Step 6 part a
	State#chat_st{registrations = maps:remove(ClientPID, State#chat_st.registrations)},
	io:format("~p~n",[State]),
    State.

%% This function should update the nickname of specified client.
do_update_nick(State, ClientPID, NewNick) ->
	% /nick step 6 pt 2
	State#chat_st{
		registrations = maps:update(ClientPID, NewNick, State#chat_st.registrations)	
	}.

%% This function should update all clients in chatroom with new message
%% (read assignment specs for details)
do_propegate_message(State, Ref, ClientPID, Message) ->
	
	% Sending Client Part 4
	ClientPID ! {self(), Ref, ack_msg},

	% Receiving Client Part 1
	% get client nickname
	ClientNick = maps:get(ClientPID, State#chat_st.registrations),
	Fun = fun(PID) ->
		if PID =/= ClientPID ->
			PID ! {request, self(), Ref, {incoming_msg, ClientNick, State#chat_st.name, Message}};
		true -> do_nothing
		end
	end,
	lists:foreach(Fun, maps:keys(State#chat_st.registrations)),
    State#chat_st{history = State#chat_st.history ++ [{ClientNick, Message}]}.

	% List_Send_to = lists:delete(ClientPID, maps:keys(State#chat_st.registrations)),
	% lists:map(fun(X) -> X ! {request, self(), Ref, {incoming_msg, CliNick, State#chat_st.name, Message}} end, List_Send_to),

	% % Receiving Client part 2
	% State#chat_st.history = [{CliNick, Message}] ++ State#chat_st.history,



    % io:format("chatroom:do_propegate_message(...): IMPLEMENT ME~n"),
    % State.
