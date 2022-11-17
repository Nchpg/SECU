# use "list_tools.ml";;

let insert_list list rank sublist =
  if rank < 1 then invalid_arg "insert_list: invalid rank"
  else
    let rec _insert_list list rank =
      match list with
      |list when rank = 1 -> append sublist list
      |[] -> failwith "insert_list: list too short"
      |e::list -> e::_insert_list list (rank-1)
    in _insert_list list rank
;;

let insert_list_multiple ml sl list_rank =
  let rec _insert_list_multiple ml list_rank n =
      match ml, list_rank  with
        |[], [] -> []
        |ml, r::list_rank when n = r ->
            let rec cross_l =function
              |[] -> _insert_list_multiple ml list_rank n
              |e::sl -> e::cross_l sl
            in cross_l sl
        |e::ml, _-> e::_insert_list_multiple ml list_rank (n+1)
    in _insert_list_multiple ml list_rank 1
;;
