#use "list_tools.ml";;

let rigit x list =
  let rec _rigit i list =
    match list with
    |[] -> failwith "rigit: out of base"
    |e::l -> if e = x then i
             else _rigit (i+1) l
  in _rigit 0 list
;;

let recompose rep base =
  let len = length base in
  let rec _recompose rep acc =
    match rep with
    |[] -> acc
    |e::l -> _recompose l ((rigit e base)+acc*len)
  in _recompose rep 0
;;


(*Pas meme renvoi pour 0*)
let decompose x base =
  if x < 0 then invalid_arg "decompose: negative number"
  else let rec _decompose x b acc=
         let q=x/b and r=x mod b in
         if q=0 then (nth r base)::acc
         else _decompose q b ((nth r base)::acc)
    in _decompose x (length base) []
;;
