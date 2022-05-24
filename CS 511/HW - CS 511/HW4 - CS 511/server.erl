% Ankit Patel & Christian Bautista
% CS 511 HW4: Due 12/1/21
% I pledge my honor that I have abided by the Stevens Honor System.

-module(server).

-export([start_server/0]).

-include_lib("./defs.hrl").

-spec start_server() -> _.
-spec loop(_State) -> _.
-spec do_join(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_leave(_ChatName, _ClientPID, _Ref, _State) -> _.
-spec do_new_nick(_State, _Ref, _ClientPID, _NewNick) -> _.
-spec do_client_quit(_State, _Ref, _ClientPID) -> _NewState.

start_server() ->
    catch(unregister(server)),
    register(server, self()),
    case whereis(testsuite) of
		undefined -> ok;
		TestSuitePID -> TestSuitePID!{server_up, self()}
	end,
	loop(
		#serv_st {
			nicks = maps:new(), %% nickname map. client_pid => "nickname"
			registrations = maps:new(), %% registration map. "chat_name" => [client_pids]
			chatrooms = maps:new() %% chatroom map. "chat_name" => chat_pid
		}
	).

loop(State) ->
    receive 
	%% initial connection
	{ClientPID, connect, ClientNick} ->
	    NewState =
		#serv_st{
		   nicks = maps:put(ClientPID, ClientNick, State#serv_st.nicks),
		   registrations = State#serv_st.registrations,
		   chatrooms = State#serv_st.chatrooms
		  },
	    loop(NewState);
	%% client requests to join a chat
	{ClientPID, Ref, join, ChatName} ->
	    NewState = do_join(ChatName, ClientPID, Ref, State),
	    loop(NewState);
	%% client requests to join a chat
	{ClientPID, Ref, leave, ChatName} ->
	    NewState = do_leave(ChatName, ClientPID, Ref, State),
	    loop(NewState);
	%% client requests to register a new nickname
	{ClientPID, Ref, nick, NewNick} ->
	    NewState = do_new_nick(State, Ref, ClientPID, NewNick),
	    loop(NewState);
	%% client requests to quit
	{ClientPID, Ref, quit} ->
	    NewState = do_client_quit(State, Ref, ClientPID),
	    loop(NewState);
	{TEST_PID, get_state} ->
	    TEST_PID!{get_state, State},
	    loop(State)
    end.

%% executes join protocol from server perspective
do_join(ChatName, ClientPID, Ref, State) ->
	case maps:find(ChatName, State#serv_st.chatrooms) of
		{ok, _ChatPID} ->
			{ok, RoomValue} = maps:find(ChatName, State#serv_st.chatrooms),
			{ok, ClientNick} = maps:find(ClientPID, State#serv_st.nicks),
			RoomValue ! {self(), Ref, register, ClientPID, ClientNick},
			State#serv_st {
				nicks = State#serv_st.nicks,
				registrations = maps:update(
									ChatName,
									lists:append([ClientPID], maps:get(ChatName, State#serv_st.registrations)),
									State#serv_st.registrations),
				chatrooms = State#serv_st.chatrooms
			};
		error ->
			NewChatRoom = spawn(chatroom, start_chatroom, [ChatName]),
			NewRooms = maps:put(ChatName, NewChatRoom, State#serv_st.chatrooms),
			{ok, RoomValue} = maps:find(ChatName, NewRooms),
			{ok, ClientNick} = maps:find(ClientPID, State#serv_st.nicks),
			RoomValue ! {self(), Ref, register, ClientPID, ClientNick},
			State#serv_st {
				nicks = State#serv_st.nicks,
				registrations = maps:put(ChatName, [ClientPID], State#serv_st.registrations),
				chatrooms = NewRooms
			}
	end.

	% % /join step 4
	% Ctrm = maps:get(ChatName, State#serv_st.chatrooms, error), %get chatroom id.
	% case Ctrm of 
	% 	error ->
	% 		chatroom:start_chatroom(ChatName);
	% 	_ ->
	% 		DummyVal = 1
	% 		% continue 	%do nothing.
	% end

	% % /join step 5
	% Lkup_nname = maps:get( ClientPID, State#serv_st.nicks, error), %client nickname

	% % /join step 6
	% Ctrm ! {self(), Ref, register, ClientPID, ClientNick},

	% % /join #chat step 7
	% % State#serv_st.registrations = maps:put(ChatName, 
	% % 	[ClientPID] ++ maps:get(ChatName, State#serv_st.registrations, []), 
	% % 			State#serv_st.registrations),

	% State#serv_st = {nicks = State#serv_st.nicks, 
	% 		registrations = maps:put(ChatName, [ClientPID] ++ maps:get(ChatName, State#serv_st.registrations, []), 
	% 			State#serv_st.registrations),
	% 		chatrooms = State#serv_st.chatrooms		
	% 	},			


    % % io:format("server:do_join(...): IMPLEMENT ME~n"),
    % State.

%% executes leave protocol from server perspective
do_leave(ChatName, ClientPID, Ref, State) ->

	% /leave step 4
	ChatPID = maps:get(ChatName, State#serv_st.chatrooms),

	% /leave step 5
	% NewPIDList = lists:delete(ClientPID, maps:get(ChatName, State#serv_st.registrations)),
	% Substitution for above line

	ClientPIDs = maps:get(ChatName, State#serv_st.registrations),
	NewPIDList = maps:put(
			ChatName,
	 		lists:delete(ClientPID, ClientPIDs),
	 		State#serv_st.registrations),

	% /leave step 6
	ChatPID ! {self(), Ref, unregister, ClientPID},

	% /leave step 7
	ClientPID ! {self(), Ref, ack_leave},

	% State#serv_st.registrations = maps:update(Chatroom_PID, NewPIDList, State#serv_st.registrations),
	State#serv_st {
		nicks = State#serv_st.nicks, 
		registrations = maps:remove(ChatPID, NewPIDList),
		chatrooms = State#serv_st.chatrooms
	}.

%% executes new nickname protocol from server perspective
%%	NewNick parameter renamed to Nick to keep consistency with spec.
do_new_nick(State, Ref, ClientPID, Nick) ->
	% /nick step 4 pt 1
	case lists:member(Nick, maps:values(State#serv_st.nicks)) of
		true ->
			ClientPID ! {self(), Ref, err_nick_used},
			State; % return
		false ->
			% /nick step 5
			NewState = State#serv_st{nicks = maps:update(ClientPID, Nick, State#serv_st.nicks)},
			Fun = fun(ChatName) -> 
					case lists:member(ClientPID, maps:get(ChatName, State#serv_st.registrations)) of
						true -> 
							maps:get(ChatName, State#serv_st.chatrooms) ! {self(), Ref, update_nick, ClientPID, Nick};
						false -> do_nothing
					end
			end,
			lists:foreach(Fun, maps:keys(State#serv_st.registrations)),
		
			% % /nick step 6
			% List_of_ChatroomPIDs = maps:values(State#serv_st.chatrooms),
			% lists:map(fun(X) -> X ! {self(), Ref, update_nick, ClientPID, Nick} end, List_of_ChatroomPIDs),
			% %  /nick step 7

			ClientPID ! {self(), Ref, ok_nick},
    		NewState
	end.

%% executes client quit protocol from server perspective
do_client_quit(State, Ref, ClientPID) ->
	NewState = State#serv_st{
		nicks = maps:remove(ClientPID, State#serv_st.nicks)
	},
	Fun = fun(ChatName) -> 
			case lists:member(ClientPID, maps:get(ChatName, State#serv_st.registrations)) of
				true -> 
					maps:get(ChatName, State#serv_st.chatrooms) ! {self(), Ref, unregister, ClientPID};
				false -> do_nothing
			end
		  end,
	lists:foreach(Fun, maps:keys(State#serv_st.registrations)),
	ClientPID ! {self(), Ref, ack_quit},
	io:format("~p~n",[State]),
	NewState.

	% % /quit step 3 pt a
	% State#serv_st.nicks = maps:remove(ClientPID,State#serv_st.nicks),

	% % /quit step 3 pt b
	% % get chatroom names where ClientPID is in the value list.
	% List_of_regs = maps:to_list(State#serv_st.registrations),
	% List_of_ChatroomNames = lists:map(fun({K,_V}) -> K end, lists:filter(fun({_ChatName,List_PID}) -> lists:member(ClientPID, List_PID) end, List_of_regs)),

	% % Get list of chatroomPIDs from the list of chatroom names.
	% List_of_ChatroomPIDs = lists:map(fun(X) -> maps:get(X,State#serv_st.chatrooms) end, List_of_ChatroomNames),

	% lists:map(fun(X) -> X ! {self(), Ref, unregister, ClientPID} end, List_of_ChatroomPIDs),

	% % /quit step 3 pt c
	% State#serv_st.registrations = maps:from_list(lists:map(fun({K,V}) -> {K, lists:delete(ClientPID,V)} end, List_of_regs)),

	% % /quit step 4
	% ClientPID ! {self(), Ref, ack_quit},

    % io:format("server:do_client_quit(...): IMPLEMENT ME~n"),
    % State.
