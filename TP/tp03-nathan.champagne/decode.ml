# use "list_tools.ml";;

let rec is_prefix plist = function
    |[] -> false
    |l::list -> prefix plist l || is_prefix plist list
;;


let rec decodable = function
    |[] -> true
    |c::l -> (not (is_prefix c l)) && decodable l
;;
