let isGoodCode x = match x with
  |y when y <0 -> invalid_arg "x is negative"
  |y when y <1000 -> invalid_arg "x is too short"
  |y when y >=10000 -> invalid_arg "x is too long"
  |_ -> let mi = x/1000 and c = x/100 mod 10 and d = x/10 mod 10 and u = x mod 10 in (mi + c + d + u = 13 && mi = 2 * u && c = 3 * d);;

isGoodCode 6310;;

let plate x = match x with
  |y when y <1000 || y >=10000 -> invalid_arg "plate : parameter is not a 4 - digit natural "
  |_ -> let mi = x/1000 and c = x/100 mod 10 and d = x/10 mod 10 and u = x mod 10 in (mi=c && d=u && let root = int_of_float(sqrt(float_of_int x)) in root*root = x) ;;


plate 7744;;

let surface x = match x with
  |y when y <0 -> invalid_arg "surface : negative parameter , cannot be a surface area "
  |_ -> let x = x - 5000 in if x < 0 || x > 1000 then false else let x = x*1000+x in let x = x/7 - 7 * x mod 7 in let x = x/11 - 11 * x mod 11 in let x = x/13 - 13 * x mod 13 in x = 555;;

let tomorrow s = let j = int_of_string (String.sub s 0 2) and m = int_of_string (String.sub s 3 2) and a = int_of_string (String.sub s 6 4) in (j, m, a);;
