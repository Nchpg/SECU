(*1.1 | BASICS*)


let length l =
  let rec _length l acc =
    match l with
    |[] -> acc
    |e::l -> _length l (acc+1)
  in _length l 0
;;


let nth n list =
  if n < 0 then invalid_arg "nth: index must be a natural"
  else
    let rec _nth n list =
      match list with
      |[] -> failwith "nth: list is too short"
      |e::l -> if n = 0 then e
        else _nth (n-1) l
    in _nth n list
;;

let rec prefix list1 list2 =
  match list1, list2 with
  |_, []|[], _ -> true
  |e1::l1, e2::l2 -> e1=e2 && prefix l1 l2
;;


(*1.2 | CONSTRUIRE - MODIFIER*)

let init_list n x =
  if n < 0 then invalid_arg "init_list: n must be a natural"
  else
    let rec _init_list n acc =
      if n = 0 then acc
      else _init_list (n-1) (x::acc)
    in _init_list n []
;;

let rec append l1 l2 =
  match l1 with
  |[] -> l2
  |e::l1 -> e::append l1 l2
;;

let rec put_list v i list =
  match list with
  |[] -> []
  |e::l when i = 0 -> v::l
  |e::l -> e::put_list v (i-1) l
;;

(*1.3 | 'a list list *)

let init_board (l, c) x =
  let rec _init_board n acc =
    if n = 0 then acc
    else _init_board (n-1) (init_list c x :: acc)
  in _init_board l []
;;

let get_cell (x, y) board =
  if x>=0 && y >=0 then nth y (nth x board)
  else invalid_arg "get_cell: indexs must be naturals"
;;


let put_cell v (x, y) board =
  if x >= 0 && y >= 0 then put_list (put_list v y (nth x board)) x board
  else invalid_arg "put_cell: index must be naturals"
;;

