(* Christian Bautista
 * 2/21/20
 * I pledge my honor that I have abided by the Stevens Honor System. *)

(* ******************************************** *)
(** Basic functions on finite automata *)
(* ******************************************** *)
(**
   Code stub for assignment 1
*)

type symbol = char
type input = char list

type state = string

(* transition function *)
type tf = (state * symbol * state) list

(* initial state * transition function * end state *)
type fa = {states: state list; start: state; tf: tf; final: state list}


(* ******************************************** *)
(* Examples of automata *)
(* ******************************************** *)

let a = {states = ["q0";"q1";"q2"];
         start = "q0";
         tf = [("q0",'a',"q1"); ("q1",'b',"q1"); ("q1",'c',"q2")];
         final = ["q2"]}

let a2 = {states = ["q0";"q1";"q2";"q3";"q4"];
          start = "q0";
          tf = [("q0",'a',"q1"); ("q1",'b',"q1")
               ; ("q1",'c',"q2");  ("q3",'a',"q4")];
          final= ["q2"]
         }
let tf_of_a = [("q0",'a',"q1"); ("q1",'b',"q1"); ("q1",'c',"q2")]



(* ******************************************** *)
(* Helper functions *)
(* ******************************************** *)

let input_of_string s =
    let rec exp i l =
        if i < 0 then l else exp (i - 1) (s.[i] :: l) in exp (String.length s - 1) []
(* o = origin state; s = symbol; d = destination state *)
let trans_origin ((o: state),(s: symbol),(d: state)) : state = o
let trans_symbol ((o: state),(s: symbol),(d: state)) : symbol = s
let trans_destination ((o: state),(s: symbol),(d: state)) : state = d
let rec is_final (st: state) (f: state list) : bool = 
    match f with
    | [] -> false
    | h::t -> if (compare st h)==0 then true else is_final st t
let rec dupe_check (s: symbol) (sl: symbol list) : bool =
    match sl with
    | [] -> false 
    | h::t -> if s==h then true else dupe_check s t
let rec dupes (sl: symbol list) : bool = 
    match sl with
    | [] -> false
    | h::t -> if (dupe_check h t) then true else dupes t
let rec find_symbols (tf: tf) (st: state) : symbol list = 
    match tf with
    | [] -> []
    | h::t -> if (compare (trans_origin h) st)==0 then (trans_symbol h)::(find_symbols t st) else find_symbols t st
let rec is_member (st: state) (sl: state list) : bool =
    match sl with
    | [] -> false
    | h::t -> if (compare st h)==0 then true else is_member st t
let rec is_member_final (fs: state list) (sl: state list) : bool =
    match fs with
    | [] -> true
    | h::t -> if (is_member h sl)==true then is_member_final t sl else false
let rec find_neighbors (st: state) (r: state list) (tf: tf) : state list =
    match tf with
    | [] -> r
    | h::t -> if ((compare (trans_origin h) st)==0) && ((is_member (trans_destination h) r)==false) then find_neighbors st ((trans_destination h)::r) t else find_neighbors st r t
let rec remove_dupe_single (st: state) (sl: state list) : state list = 
    match sl with
    | [] -> []
    | h::t -> if (compare st h)==0 then remove_dupe_single st t else h :: remove_dupe_single st t
let rec remove_dupes (sl: state list) : state list = 
    match sl with
    | [] -> []
    | h::t -> h::(remove_dupes (remove_dupe_single h t))
let rec append_no_dupes (s1: state list) (s2: state list) : state list = 
    match s1 with
    | [] -> s2
    | h::t -> if (is_member h s2)==true then (append_no_dupes t s2) else (append_no_dupes t (h::s2))
(* ******************************************** *)
(* Simulating automata *)
(* ******************************************** *)

let rec apply_transition_function (f: tf) (st: state) (sym: symbol) : state option = 
    match f with
    | [] -> None
    | h::t -> if trans_symbol h == sym then Some (trans_destination h) else apply_transition_function t st sym

let accept (fa: fa) (input: input) : bool =
    let rec transition (st: state) (i: input): bool = 
        match i with
        | [] -> (is_final st fa.final)
        | h::t -> (
            match apply_transition_function fa.tf st h with
            | None -> false
            | Some s -> transition s t
        ) in transition fa.start input

let determistic (fa: fa) : bool = 
    let rec determine_state (tf: tf) (st: state list) : bool = 
        match st with
        | [] -> true
        | h::t -> if (dupes (find_symbols tf h))==true then false else determine_state tf t in determine_state fa.tf fa.states

let valid (fa: fa) : bool = 
    if (is_member fa.start fa.states) && (is_member_final fa.final fa.states) && (determistic fa) then true else false

let reachable (fa: fa) : state list =
    let rec bfs (q: state list) (r: state list) (tf: tf) : state list = 
        match q with
        | [] -> r
        | h::t -> bfs (append_no_dupes (find_neighbors h r tf) (append_no_dupes r t)) (append_no_dupes (find_neighbors h r tf) r) tf in bfs (fa.start::[]) (fa.start::[]) fa.tf