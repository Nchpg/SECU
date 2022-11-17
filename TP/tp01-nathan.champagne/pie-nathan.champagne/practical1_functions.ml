(* To see how functions with several parameters work *)
let range a b = (a + b) / 2 ;;

let rangeBis (a, b) = (a + b) / 2 ;; 

#trace range ;;
#trace rangeBis ;;

range 15 27 ;;
rangeBis (15, 27) ;;


#untrace range ;;
range 2 15 ;;

let add_curry a b c d e = a + b + c + d + e ;;
let add (a, b, c, d, e) =  a + b + c + d + e ;;

#trace add_curry ;;
#trace add ;;

add (1, 2, 3, 4, 5) ;;
add_curry 1 2 3 4 5 ;;


(* Scope *)

let a = 1 ;;
let f x = x + a ;;
f 4 ;;
let a = 5 ;;
f 4 ;; (* try to explain the result *)

let succ x = x - 1 ;;
#trace succ ;;
let square x = x * x ;;
#trace square ;;
let square_of_succ x = square(succ x) ;;
#trace square_of_succ ;;
square_of_succ 2 ;;
let succ x = x + 1 ;;
square_of_succ 2 ;;
succ 2 ;;
