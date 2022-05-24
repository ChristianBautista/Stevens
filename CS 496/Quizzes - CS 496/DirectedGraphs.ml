(* Christian Bautista and Min Cheon*)
(* Sample Directed Graph *)

let ex = [(1, 2); (2, 3); (3, 1); (3, 4)]


(*
  1 <---- 3
  |     /\ |
  |    /   | 
 \/  /    \/
  2       4
*)
       
(* 
Eg. outgoing ex 3 => [1,4] 
g = edges
n = node
*)
let rec outgoing_nodes g n =
  match g with
  | [] -> []
  | h::t -> if fst h == n then snd h :: outgoing_nodes t n else outgoing_nodes t n
    
(* 
   The list of nodes of the tree without duplicates. The order of the
   nodes in the list is irrelevant.
   eg. nodes ex => [1,2,3,4] 
*)

let rec is_member l n =
  match l with
  | [] -> false
  | h::t -> if h==n then true else is_member t n

let rec remove_dupes l n = 
  match l with 
  | [] -> []
  | h::t -> if is_member n h then remove_dupes t n else h :: remove_dupes t n

let rec nodes g =
  match g with
  | [] -> []
  | h::t -> fst h :: snd h :: nodes t 


(* 
   Remove a node from the graph
   Eg. remove ex 2 =>  [(3, 1); (3, 4)] 
*)
let rec remove g n =
  match g with
  | [] -> []
  | h::t -> if fst h == n or snd h == n then remove t n else h :: remove t n
  
(* Reachable nodes from a source node. (Extra-credit)
   Eg. reachale ex 3 => [1,4,2,3] 
*)

let rec reachable g n =
  failwith "implement me"