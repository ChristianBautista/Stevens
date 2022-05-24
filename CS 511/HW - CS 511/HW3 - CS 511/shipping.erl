-module(shipping).
-compile(export_all).
-include_lib("./shipping.hrl").

get_ship(Shipping_State, Ship_ID) ->
    case lists:keysearch(Ship_ID, #ship.id, Shipping_State#shipping_state.ships) of
        {value, Ship} -> Ship;
        false -> error;
        _ -> wrong_error
end.

get_container(Shipping_State, Container_ID) ->
    case lists:keysearch(Container_ID, #container.id, Shipping_State#shipping_state.containers) of
        {value, Container} -> Container;
        false -> error;
        _ -> wrong_error
end.

get_port(Shipping_State, Port_ID) ->
    case lists:keysearch(Port_ID, #port.id, Shipping_State#shipping_state.ports) of
        {value, Port} -> Port;
        false -> error;
        _ -> wrong_error
end.

get_occupied_docks(Shipping_State, Port_ID) ->
    [Dock || 
        {Port, Dock, _} <- Shipping_State#shipping_state.ship_locations,
        (Port == Port_ID)
    ].

get_ship_location(Shipping_State, Ship_ID) ->
    case lists:keyfind(Ship_ID, 3, Shipping_State#shipping_state.ship_locations) of
        {Port_ID, Dock_ID, _} -> {Port_ID, Dock_ID};
        false -> error;
        _ -> wrong_error
    end.

get_container_weight(Shipping_State, Container_IDs) ->
    Weights = lists:map(
                fun(Container_ID) ->
    		        Container = shipping:get_container(Shipping_State, Container_ID),
    		        case Container of 
    			        error ->
    				        error;
				        _ ->
					        Container#container.weight
			        end
		        end,
		        Container_IDs),
    case lists:member(error, Weights) of
    	true ->
    		error;
		false ->
			lists:sum(Weights)
	end.

get_ship_weight(Shipping_State, Ship_ID) ->
    case maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory, error) of
        error -> error;
        Container_IDs -> get_container_weight(Shipping_State, Container_IDs)
    end.

load_ship(Shipping_State, Ship_ID, Container_IDs) ->
    % 1. Make sure all containers are at same port as ship
    % 2. Make sure # of containers <= ship_cap - num_ship_containers
    % 3. Update port_inventory & ship_inventory
    case get_ship_location(Shipping_State, Ship_ID) of
        error -> error;
        {Port_ID, _} ->
            Ship = get_ship(Shipping_State, Ship_ID),
            case Ship of
                error -> error;
                _ -> 
                    Port_Inventory = maps:get(Port_ID, Shipping_State#shipping_state.port_inventory, error),
                    case Port_Inventory of
                        error -> error;
                        _ ->
                            Port_Match = lists:all(
                                            fun(Container) ->
                                                lists:member(Container, Port_Inventory)
                                                end,
                                            Container_IDs),
                            case Port_Match of
                                false -> error;
                                _ -> 
                                    Ship_Inventory = maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory, error),
                                    case Ship_Inventory of
                                        error -> error;
                                        _ -> 
                                            case (length(Ship_Inventory)+length(Container_IDs) =< Ship#ship.container_cap) of
                                                false -> error;
                                                true -> 
                                                    New_Port_Inventory = lists:filter(
                                                                            fun(Container) ->
                                                                                not lists:member(Container, Container_IDs)
                                                                            end,
                                                                            Port_Inventory),
                                                    New_Ship_Inventory = lists:merge(Ship_Inventory,Container_IDs),
                                                    {ok, #shipping_state {
                                                        ships = Shipping_State#shipping_state.ships,
                                                        containers = Shipping_State#shipping_state.containers,
                                                        ports = Shipping_State#shipping_state.ports,
                                                        ship_locations = Shipping_State#shipping_state.ship_locations,
                                                        ship_inventory = maps:put(Ship_ID, New_Ship_Inventory, Shipping_State#shipping_state.ship_inventory),
                                                        port_inventory = maps:put(Port_ID, New_Port_Inventory, Shipping_State#shipping_state.port_inventory)
                                                    }}
                                            end
                                    end
                            end                        
                    end
            end;
        _ -> wrong_error
    end.

unload_ship_all(Shipping_State, Ship_ID) ->
    % 1. Get ship (make sure it exists)
    % 2. Get ship inventory
    % 3. Get port (make sure it extsts)
    % 4. Get port inventory
    % 5. Check if length(ship_inventory) + length(port_inventory) <= port.capacity
    case get_ship_location(Shipping_State, Ship_ID) of 
        error -> error;
        {Port_ID, _} -> 
            Port = get_port(Shipping_State, Port_ID),
            case Port of
                error -> error;
                _ -> 
                    Ship = get_ship(Shipping_State, Ship_ID),
                    case Ship of
                        error -> error;
                        _ -> 
                            Port_Inventory = maps:get(Port_ID, Shipping_State#shipping_state.port_inventory, error),
                            case Port_Inventory of
                                error -> error;
                                _ ->
                                    Ship_Inventory = maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory, error),
                                    case Ship_Inventory of
                                        error -> error;
                                        _ ->
                                            case (length(Port_Inventory)+length(Ship_Inventory) =< Port#port.container_cap) of
                                                false -> error;
                                                true -> 
                                                    New_Port_Inventory = lists:merge(Port_Inventory, Ship_Inventory),
                                                    {ok, #shipping_state {
                                                        ships = Shipping_State#shipping_state.ships,
                                                        containers = Shipping_State#shipping_state.containers,
                                                        ports = Shipping_State#shipping_state.ports,
                                                        ship_locations = Shipping_State#shipping_state.ship_locations,
                                                        ship_inventory = maps:put(Ship_ID, [], Shipping_State#shipping_state.ship_inventory),
                                                        port_inventory = maps:put(Port_ID, New_Port_Inventory, Shipping_State#shipping_state.port_inventory)
                                                    }}
                                            end
                                    end
                            end
                    end
            end;
        _ -> wrong_error
    end.

unload_ship(Shipping_State, Ship_ID, Container_IDs) ->
    % 1. Get ship (make sure it exists)
    % 2. Get ship inventory
    % 3. Check if Container_IDs are all in ship inventory
    % 5. Get port (make sure it extsts)
    % 6. Get port inventory
    % 7. Check if length(Container_IDs) + length(Port_Inventory) <= port.capacity
    case get_ship_location(Shipping_State, Ship_ID) of 
        error -> error;
        {Port_ID, _} -> 
            Ship = get_ship(Shipping_State, Ship_ID),
            case Ship of
                error -> error;
                _ -> 
                    Ship_Inventory = maps:get(Ship_ID, Shipping_State#shipping_state.ship_inventory, error),
                    case Ship_Inventory of
                        error -> error;
                        _ ->                          
                            Ship_Inventory_Match = lists:all(
                                                        fun(Container) ->
                                                            lists:member(Container, Ship_Inventory)
                                                            end,
                                                        Container_IDs),
                            case Ship_Inventory_Match of
                                false -> 
                                    % io:format("The given conatiners are not all on the same ship...~n"),
                                    error;
                                true ->
                                    Port = get_port(Shipping_State, Port_ID),
                                    case Port of
                                        error -> error;
                                        _ -> 
                                            Port_Inventory = maps:get(Port_ID, Shipping_State#shipping_state.port_inventory, error),
                                            case Port_Inventory of
                                                error -> error;
                                                _ ->
                                                    case (length(Port_Inventory)+length(Container_IDs) =< Port#port.container_cap) of
                                                        false -> error;
                                                        true -> 
                                                            New_Port_Inventory = lists:merge(Port_Inventory, Container_IDs),
                                                            New_Ship_Inventory = lists:filter(
                                                                                    fun(Container) ->
                                                                                        not lists:member(Container, Container_IDs)
                                                                                    end,
                                                                                    Ship_Inventory),
                                                            {ok, #shipping_state {
                                                                ships = Shipping_State#shipping_state.ships,
                                                                containers = Shipping_State#shipping_state.containers,
                                                                ports = Shipping_State#shipping_state.ports,
                                                                ship_locations = Shipping_State#shipping_state.ship_locations,
                                                                ship_inventory = maps:put(Ship_ID, New_Ship_Inventory, Shipping_State#shipping_state.ship_inventory),
                                                                port_inventory = maps:put(Port_ID, New_Port_Inventory, Shipping_State#shipping_state.port_inventory)
                                                            }}
                                                    end
                                            end
                                    end
                            end
                    end
            end;
        _ -> wrong_error
    end. 

set_sail(Shipping_State, Ship_ID, {Port_ID, Dock}) ->
    Port_Dock_Available = lists:all(
                                fun(Ship_Location) ->
                                    case Ship_Location of
                                        {Port_ID, Dock, _} -> false;
                                        _ -> true
                                    end
                                end,
                                Shipping_State#shipping_state.ship_locations),
    case Port_Dock_Available of
        false -> error;
        true ->
            {ok, #shipping_state {
                ships = Shipping_State#shipping_state.ships,
                containers = Shipping_State#shipping_state.containers,
                ports = Shipping_State#shipping_state.ports,
                ship_locations = lists:merge(
                                    lists:keydelete(Ship_ID, 3, Shipping_State#shipping_state.ship_locations),
                                    [{Port_ID, Dock, Ship_ID}]),
                ship_inventory = Shipping_State#shipping_state.ship_inventory,
                port_inventory = Shipping_State#shipping_state.port_inventory
            }}
    end.





%% Determines whether all of the elements of Sub_List are also elements of Target_List
%% @returns true is all elements of Sub_List are members of Target_List; false otherwise
is_sublist(Target_List, Sub_List) ->
    lists:all(fun (Elem) -> lists:member(Elem, Target_List) end, Sub_List).




%% Prints out the current shipping state in a more friendly format
print_state(Shipping_State) ->
    io:format("--Ships--~n"),
    _ = print_ships(Shipping_State#shipping_state.ships, Shipping_State#shipping_state.ship_locations, Shipping_State#shipping_state.ship_inventory, Shipping_State#shipping_state.ports),
    io:format("--Ports--~n"),
    _ = print_ports(Shipping_State#shipping_state.ports, Shipping_State#shipping_state.port_inventory).


%% helper function for print_ships
get_port_helper([], _Port_ID) -> error;
get_port_helper([ Port = #port{id = Port_ID} | _ ], Port_ID) -> Port;
get_port_helper( [_ | Other_Ports ], Port_ID) -> get_port_helper(Other_Ports, Port_ID).


print_ships(Ships, Locations, Inventory, Ports) ->
    case Ships of
        [] ->
            ok;
        [Ship | Other_Ships] ->
            {Port_ID, Dock_ID, _} = lists:keyfind(Ship#ship.id, 3, Locations),
            Port = get_port_helper(Ports, Port_ID),
            {ok, Ship_Inventory} = maps:find(Ship#ship.id, Inventory),
            io:format("Name: ~s(#~w)    Location: Port ~s, Dock ~s    Inventory: ~w~n", [Ship#ship.name, Ship#ship.id, Port#port.name, Dock_ID, Ship_Inventory]),
            print_ships(Other_Ships, Locations, Inventory, Ports)
    end.

print_containers(Containers) ->
    io:format("~w~n", [Containers]).

print_ports(Ports, Inventory) ->
    case Ports of
        [] ->
            ok;
        [Port | Other_Ports] ->
            {ok, Port_Inventory} = maps:find(Port#port.id, Inventory),
            io:format("Name: ~s(#~w)    Docks: ~w    Inventory: ~w~n", [Port#port.name, Port#port.id, Port#port.docks, Port_Inventory]),
            print_ports(Other_Ports, Inventory)
    end.
%% This functions sets up an initial state for this shipping simulation. You can add, remove, or modidfy any of this content. This is provided to you to save some time.
%% @returns {ok, shipping_state} where shipping_state is a shipping_state record with all the initial content.
shipco() ->
    Ships = [#ship{id=1,name="Santa Maria",container_cap=20},
              #ship{id=2,name="Nina",container_cap=20},
              #ship{id=3,name="Pinta",container_cap=20},
              #ship{id=4,name="SS Minnow",container_cap=20},
              #ship{id=5,name="Sir Leaks-A-Lot",container_cap=20}
             ],
    Containers = [
                  #container{id=1,weight=200},
                  #container{id=2,weight=215},
                  #container{id=3,weight=131},
                  #container{id=4,weight=62},
                  #container{id=5,weight=112},
                  #container{id=6,weight=217},
                  #container{id=7,weight=61},
                  #container{id=8,weight=99},
                  #container{id=9,weight=82},
                  #container{id=10,weight=185},
                  #container{id=11,weight=282},
                  #container{id=12,weight=312},
                  #container{id=13,weight=283},
                  #container{id=14,weight=331},
                  #container{id=15,weight=136},
                  #container{id=16,weight=200},
                  #container{id=17,weight=215},
                  #container{id=18,weight=131},
                  #container{id=19,weight=62},
                  #container{id=20,weight=112},
                  #container{id=21,weight=217},
                  #container{id=22,weight=61},
                  #container{id=23,weight=99},
                  #container{id=24,weight=82},
                  #container{id=25,weight=185},
                  #container{id=26,weight=282},
                  #container{id=27,weight=312},
                  #container{id=28,weight=283},
                  #container{id=29,weight=331},
                  #container{id=30,weight=136}
                 ],
    Ports = [
             #port{
                id=1,
                name="New York",
                docks=['A','B','C','D'],
                container_cap=200
               },
             #port{
                id=2,
                name="San Francisco",
                docks=['A','B','C','D'],
                container_cap=200
               },
             #port{
                id=3,
                name="Miami",
                docks=['A','B','C','D'],
                container_cap=200
               }
            ],
    %% {port, dock, ship}
    Locations = [
                 {1,'B',1},
                 {1, 'A', 3},
                 {3, 'C', 2},
                 {2, 'D', 4},
                 {2, 'B', 5}
                ],
    Ship_Inventory = #{
      1=>[14,15,9,2,6],
      2=>[1,3,4,13],
      3=>[],
      4=>[2,8,11,7],
      5=>[5,10,12]},
    Port_Inventory = #{
      1=>[16,17,18,19,20],
      2=>[21,22,23,24,25],
      3=>[26,27,28,29,30]
     },
    #shipping_state{ships = Ships, containers = Containers, ports = Ports, ship_locations = Locations, ship_inventory = Ship_Inventory, port_inventory = Port_Inventory}.
