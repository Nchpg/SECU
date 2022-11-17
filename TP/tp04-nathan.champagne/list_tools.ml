#use "topfind";;
#require "graphics";;

open Graphics;;

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

(*GameOflife*)
let open_window size =
        Graphics.open_graph ( " " ^ string_of_int size ^ " x " ^ string_of_int ( size +20) )
;;



let draw_cell (x, y) size (color : Graphics.color) =
        (Graphics.set_color color; Graphics.fill_rect ((x+1)*size) ((y+1)*size) size size;
        Graphics.set_color (rgb 150 150 150);Graphics.draw_rect ((x+1)*size) ((y+1)*size) size size)
;;

let new_cell = 1 ;;
let empty = 0 ;;
let is_alive cell = cell <> empty ;;

let cell_color = function
        |0 -> Graphics.white
        |_ -> Graphics.black ;;


let board = [[1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
[0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
[1; 0; 1; 0; 1; 0; 1; 0; 1; 0];
[0; 1; 0; 1; 0; 1; 0; 1; 0; 1];
[0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
[1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
[0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
[1; 0; 1; 0; 1; 0; 1; 0; 1; 0];
[0; 1; 0; 1; 0; 1; 0; 1; 0; 1];
[0; 0; 0; 0; 0; 0; 0; 0; 0; 0]
] ;;

let draw_board board cellsize =
        let len = length board in
        let rec _walkx x =
                if x<len then
                    let rec _walky y =
                        if y<len then
                                let color = cell_color(get_cell(x, y) board) in
                                draw_cell (x, y) cellsize color; _walky (y+1)
                        else _walkx (x+1)
                    in _walky 0
                else ()
        in _walkx 0
;;










