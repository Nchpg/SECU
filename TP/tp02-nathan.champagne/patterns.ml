let build_line n str = 
        if n < 0 then invalid_arg "build_line: n must be positive"
        else let rec _build_line n str =
                if n = 0 then ""
                else str^(_build_line (n-1) str)
        in _build_line n str;;

let square n str =
        if n < 0 then invalid_arg "square: n must be positive"
        else let rec _square n str i =
                if i == n then ()
                else (print_endline (build_line n str);  _square n str (i+1))
        in _square n str 0;;

let square2 n (str1,str2) =
        if n < 0 then invalid_arg "square2: n must be positive"
        else let rec _square2 n (str1,str2) i =
                if i = n then ()
                else (print_endline (build_line n (str1^str2));
                        _square2 n (str2, str1) (i+1))
        in _square2 n (str1,str2) 0;;

let triangle n str =
        if n < 0 then invalid_arg "triangle: n must be positive"
        else let rec _triangle str i =
                if i > n then ()
                else (print_endline(build_line i (str)); _triangle str (i+1))
        in _triangle str 1;;

let pyramid n (str1, str2) = 
        if n < 0 then invalid_arg "pyramid: n must be positive"
        else let rec _pyramid n (str1, str2) i =
                if i > n then ()
                else (print_endline(
                        (build_line (n - i) (str1)) ^
                        (build_line (2*i) (str2)) ^
                        (build_line (n - i) (str1)));
                        _pyramid n (str1, str2) (i+1))
        in _pyramid n (str1, str2) 1;;

let cross n (str1, str2) =
        if n < 0 then invalid_arg "cross: n must be positive"
        else let rec _cross (str1, str2) i =
                if i = n-1 then
                        let str=((build_line i str1)^str2^(build_line i str1))
                        in print_endline(str)
                else
                        let str=((build_line i str1)^str2^(build_line (2*(n-i-1)-1) str1)^str2^build_line i str1) 
                        in (print_endline(str); _cross (str1, str2) (i+1); print_endline(str))
    in _cross (str1, str2) 0;;
