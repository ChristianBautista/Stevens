(* 

   Stub for HW2 
   Please
   1. Rename to gt.ml
   2. Place the names of the group members here:

    Name1: Christian Bautista

    I pledge my honor that I have abided by the Stevens Honor System.

*)

type 'a gt = Node of 'a*('a gt) list

let mk_leaf (n:'a) : 'a gt = Node(n,[])
    
let t : int gt =
  Node (33, 
    [Node (12,[]);
    Node (77, 
      [Node (37, 
        [Node (14, [])]); 
      Node (48, []); 
      Node (103, [])])
    ])

let rec max l m = 
  match l with
  | [] -> m
  | h::t -> if h>m then max t h else max t m

let rec height t =
  match t with
  | Node(n,[]) -> 1
  | Node(n,f::b) -> (
    let rec depth_search children depth heights =
      match children with
      | [] -> max heights 0
      | c::l -> (
        match c with 
        | Node(n,[]) -> depth_search l depth ((depth :: heights))
        | Node(n,x::y) -> depth_search l depth ((depth_search (x::y) (depth+1) []) :: heights))
    in depth_search (f::b) 2 [])
    
let rec size t =
  match t with 
  | Node(n,[]) -> 1
  | Node(n,f::b) -> 1+(
    let rec size_rec children = 
      match children with
      | [] -> 0
      | c::l -> (
        match c with
        | Node(n,[]) -> 1 + size_rec l
        | Node(n,x::y) -> 1 + size_rec (x::y) + size_rec l)
    in size_rec (f::b))

let rec i_to_ls i = 
  match i with
  | 0 -> [0]
  | _ -> (List.append (i_to_ls (i-1)) [i])

let rec paths_to_leaves t =
  match t with
  | Node(n,[]) -> [[]]
  | Node(n,ch) -> List.concat (List.map (fun x -> List.map (fun y -> x::y) (paths_to_leaves (List.nth ch x))) (i_to_ls ((List.length ch)-1)))
(*
let rec paths_to_leaves t = 
  match t with
  | Node(n,[]) -> [[0]]
  | Node(n,f::b) -> (
    let rec leaf_finder tree key path paths = 
      match tree with
      | [] -> paths
      | c::l -> (
        match c with
        | Node(n,[]) -> (leaf_finder l (key+1) path (List.append [List.append path [key]] paths))
        | Node(n,x::y) -> (leaf_finder l (key+1) path (leaf_finder (x::y) 0 (List.append path [key]) [])))
    in leaf_finder (f::b) 0 [] [])

Dear Grader,
The paths_to_leaves function doesn't function properly and the is_perfect function relies on that function to work properly.
Please take that into consideration when grading as I believe my is_perfect function would work properly with a working
paths_to_leaves function.
Thanks in advance
*)
let rec is_perfect t =
  match t with
  | Node(n,[]) -> true
  | Node(n,f::b) -> (
    let rec path_len_check paths len = 
      match paths with
      | [] -> true
      | c::l when len==0 -> path_len_check l (List.length c)
      | c::l -> if (List.length c)!=len then false else (path_len_check l len)
    in path_len_check (paths_to_leaves t) 0)

let rec preorder (Node(d,ch)) = 
  match ch with
  | [] -> [d]
  | h::t -> [d] @ (
    let rec traverse (tree: 'a gt list) : 'a list = 
      match tree with
      | [] -> []
      | Node(data,children)::siblings -> (List.append [data] (List.append (traverse children) (traverse siblings)))
    in traverse ch)
               
let rec mirror (Node(d,ch)) = (
  let rec reverser (Node(data,children)) =
    match children with
    | [] -> Node(data,[])
    | h::t -> Node(data,List.map reverser(List.rev children))
  in reverser (Node(d,ch)))
  
let rec mapt f (Node(d,ch)) =
  match ch with
  | [] -> Node(f d,[])
  | h::t -> Node(f d,(List.map (mapt f) ch))
  
let rec foldt : ('a -> 'b list -> 'b) -> 'a gt -> 'b =
  fun f (Node(d,ch)) -> f d (List.map (foldt f) ch)

let sumt t =
  foldt (fun i rs -> i + List.fold_left (fun i j -> i+j) 0 rs) t

let memt t e = 
  foldt (fun i rs -> i=e || List.exists (fun i -> i) rs) t

let mirror' t  = 
  foldt (fun d ch -> Node(d,(List.rev ch))) t