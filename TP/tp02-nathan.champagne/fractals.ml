#use "topfind" ;;
#require "graphics" ;;

open Graphics ;;
open_graph " 1200 x800 " ;;

(*Fonctions utiles*)
let draw_line (x ,y) (z,t) =
        moveto x y ;
        lineto z t ;;

let graph_reset ()=
        clear_graph (); set_color black;;

let iof = int_of_float;;
let foi = float_of_int;;

(*Mountain*)
let mountain n (x, y) (z, t) =
        if n<0 then invalid_arg("mountain : n must be positive")
        else if x < 0 || y < 0 || z < 0 || t < 0 then invalid_arg("coordinates x, y, z and t must be positive")
        else
        (graph_reset();
        let rec _mountain n (x, y) (z, t) =
                if n == 0 then
                        draw_line (x, y) (z, t)
                else
                        let h = (y+t)/2 + Random.int(abs(z-x)/5 + 20) and m = (x+z)/2
                        in (_mountain (n-1) (x, y) (m, h); _mountain (n-1) (m, h) (z, t))
        in _mountain n (x, y) (z, t))
;;


(*Dragon*)
let dragon n (x, y)(z, t) =
        if n<0 then invalid_arg("dragon : n must be positive")
        else if x < 0 || y < 0 || z < 0 || t < 0 then invalid_arg("coordinates x, y, z and t must be positive")
        else (graph_reset ();
        let rec _dragon n (x ,y) (z ,t) =
                if n == 0 then
                        draw_line (x, y) (z, t)
                else
                        let u = (x+z)/2+(t-y)/2 and v=(y+t)/2-(z-x)/2
                        in (_dragon (n-1) (x, y) (u, v);
                        _dragon (n-1) (z, t) (u,v))
        in _dragon n (x, y)(z, t))
;;


(*Carpet*)
let carpet n (x, y)=
        if n < 0 then invalid_arg("carpet : n must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else
        (graph_reset (); fill_rect x y n n;
        let rec _carpet n (x, y) =
                let k = n/.3.
                in
                  if n < 3. then
                        ()
                  else
                        (
                        set_color white;
                        fill_rect (iof (x+.k)) (iof(y+.k)) (iof k) (iof k);
                        _carpet (k) (x,y);
                        _carpet (k) ((x+.k),y);
                        _carpet (k) ((x+.2.*.k),y);
                        _carpet (k) (x,(y+.k));
                        _carpet (k) ((x+.2.*.k),(y+.k));
                        _carpet (k) (x,(y+.2.*.k));
                        _carpet (k) ((x+.k),(y+.2.*.k));
                        _carpet (k) ((x+.2.*.k),(y+.2.*.k))
                        )
        in _carpet (foi n) (foi x, foi y))
;;

(*Sierpinski*)
let getH s = iof(sqrt(s*.s-.(s/.2.)*.(s/.2.)));;

let getM (x, y) (z, t) = ((x+z)/2,(y+t)/2);;

let build_triangle p1 p2 p3 =
        begin
                draw_line p1 p2;
                draw_line p2 p3;
                draw_line p3 p1
        end
;;

let sierpinski n (x , y) s = 
        if n < 0 then invalid_arg ("sierpinski : n must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else if s < 0 then invalid_arg("size must be positive")
        else (graph_reset ();
        let rec _sierpinski n p1 p2 p3 s =
                if n = 0 then (build_triangle p1 p2 p3; fill_poly [|p1;p2;p3|])
                else (let k = s/2 in
                _sierpinski (n-1) p1 (getM p1 p3) (getM p1 p2) k;
                _sierpinski (n-1) (getM p1 p2) p2 (getM p2 p3) k;
                _sierpinski (n-1) (getM p1 p3) (getM p2 p3) p3 k)
        in _sierpinski n (x, y) (x+s, y) (x+s/2, y+getH (foi s)) s)
;;


(*Circles*)
let rec four_circles r (x, y) l = 
        if r < 0 then invalid_arg("r must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else if l < 0 then invalid_arg("limit must be positive")
        else (graph_reset();
                let rec _four_circles r (x, y) l =
                        if r > l then
                                let k = r/2 in
                                (draw_circle x y r;
                                _four_circles (k) ((x+k), y) l;
                                _four_circles (k) ((x-k), y) l;
                                _four_circles (k) (x, (y-k)) l;
                                _four_circles (k) (x, (y+k)) l;)
                        else ()
                in _four_circles r (x, y) l)
;;


(*Fleche*)
let rec _arrow r (x ,y) o l =
        if r > l then 
                (fill_circle x y r;
                let k = r/2 in(
                        if o <> 'N' then _arrow k (x, y - k - r) 'S' l;
                        if o <> 'S' then _arrow k (x, y + k + r) 'N' l;
                        if o <> 'W' then _arrow k (x + k + r, y) 'E' l;
                        if o <> 'E' then _arrow k (x - k - r, y) 'W' l))
        else ()
;;

let arrow r (x, y) o l =
        if r < 0 then invalid_arg("arrow: r must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else if o <> 'N' && o <> 'S' && o <> 'W' && o <> 'E' then invalid_arg("False direction")
        else if l < 0 then invalid_arg("limit must be positive")
        else begin graph_reset(); _arrow r (x, y) o l end
;;

(*Arbres de Pythagore*)

let build_s p1 p2 p3 p4 =
        begin
                draw_line p1 p2;
                draw_line p2 p3;
                draw_line p3 p4;
                draw_line p4 p1
        end
;;


let pytagora_tree n (x, y) s= 
        if n < 0 then invalid_arg("pytagora_tree : n must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else if s < 0 then invalid_arg("pytagora_tree : size must be positive")
        else(
            graph_reset ();
            let x=foi x and y=foi y and s=foi s
            in let rec pytagora_tree n (x1, y1) (x2, y2) (x3, y3)  (x4, y4) =
                if n = 0 then ()
                else
                        (
                        build_s (iof x1, iof y1) (iof x2, iof y2) (iof x3, iof y3) (iof x4, iof y4);
                        let dx = x4 -. x3 and dy = y4 -. y3 in
                        let a = (x4 +. x3) /. 2. +. dy /.2.
                        and b = (y4 +. y3) /. 2. -. dx /.2. in
                                let c = a +. dx and d = b +. dy
                                and e = x4 +. dy and f = y4 -. dx
                                and g = x3 +. dy and h = y3 -. dx
                                and i = a -. dx and j = b -. dy
                                in (pytagora_tree (n-1) (x4, y4) (a, b) (e, f) (c, d);
                                pytagora_tree (n-1) (a, b) (x3, y3) (i, j) (g, h))
                        )
                in pytagora_tree (n+1) (x, y) (x+.s, y) (x+.s, y+.s) (x, y+.s))
;;



(*Vicsek*)
let rec _vicsek_star n (x ,y) s =
        if n = 0 then fill_rect x y s s
        else let k = s/3 and n = n-1 in
                (_vicsek_star n (x,y) k;
                _vicsek_star n (x+2*k,y) k;
                _vicsek_star n (x, y+2*k) k;
                _vicsek_star n (x+k, y+k) k;
                _vicsek_star n (x+2*k, y+2*k) k)
;;

let vicsek_star n (x, y) s =
        if n < 0 then invalid_arg("vicsek_star: n must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else if s < 0 then invalid_arg("vicsek_star: size must be positive")
        else
                begin
                        graph_reset();
                        _vicsek_star n (x, y) s
                end
;;

(*Koch snowflake*)
let rec _koch_curve n (x, y) (z, t) =
        if n = 0 then draw_line (x, y) (z, t)
        else 
                let dx = z - x and dy = t-y in
                let xr = x + dx/3 and yr = y + dy/3
                and xl = x + 2*dx/3 and yl = y + 2*dy/3 in 
                let root = sqrt(3.)/.2. in
                let xs = (xr+xl)/2 - iof(foi(yl-yr)*.root)
                and ys = (yr+yl)/2 + iof(foi(xl-xr)*.root) in

        (_koch_curve (n-1) (x, y) (xr, yr);
        _koch_curve (n-1) (xr, yr) (xs, ys);
        _koch_curve (n-1) (xs, ys) (xl, yl);
        _koch_curve (n-1) (xl, yl) (z, t))
;;


let koch_curve n (x, y) (z, t) =
        if n < 0 then invalid_arg ("koch_curve: n must be positive")
        else
                begin
                        graph_reset();
                        _koch_curve n (x, y) (z, t)
                end
;;


let koch_snowflake n (x, y) s =
        if n < 0 then invalid_arg ("koch_snowflake: n must be positive")
        else if x < 0 || y < 0 then invalid_arg("coordinates x and y must be positive")
        else if s < 0 then invalid_arg ("koch_snowflake: size must be positive")
        else
                (let k = iof(sqrt(3.)/.4.*.foi s) in
                let a = (x-s/2, y-k)
                and b = (x+s/2, y-k)
                and c = (x, y+k) in
                begin
                        graph_reset ();
                        _koch_curve n b a;
                        _koch_curve n a c;
                        _koch_curve n c b
                end)
;;


(*Mandelbrot*)

let adjust_graph_scale (xmin, xmax, ymin, ymax) (l, h)=
        let lx = xmax -. xmin and ly = ymax -. ymin in
        let dx = (lx/.(min h l) *. l -. lx)/.2. and dy = (ly/.(min l h) *. h -. ly)/.2. in
                (xmin -. dx, xmax +. dx, ymin -. dy, ymax +. dy)
;;

let rec get_iterations_of origin z step n lim =
                if step > n then n
                else if Complex.norm origin > lim then step 
                else get_iterations_of (Complex.add(Complex.mul origin origin) z) z (step+1) n lim
;;

let mandelbrot n =
        if n < 0 then invalid_arg("mandelbrot: n must be positive")
        else (graph_reset ();
        let xmin = -2.5 and xmax = 1.5 and ymin = -2. and ymax = 2. and l = foi(size_x ()) and h = foi(size_y ()) in
        let (xmin, xmax, ymin, ymax) = adjust_graph_scale(xmin, xmax, ymin, ymax) (l, h)  and lim = 100.
        in let rec _walkx x =
                if x<l then
                    let rec _walky y = 
                        if y<h then 
                            let z = {
                                    Complex.re = (xmin +. (xmax -. xmin)/.l*.x);
                                    Complex.im = (ymin +. (ymax -. ymin)/.h*.y)}
                            in(
                                let step = get_iterations_of (Complex.zero) z 0 n lim
                                in(
                                        if step = n then set_color black
                                        else set_color (rgb
                                        (255-(230-step*230/n))
                                        (255-(180-step*180/n))
                                        (255-(100-step*100/n)));
                                 plot (int_of_float x) (int_of_float y));
                                _walky (y+.1.))
                    else _walkx (x+.1.)
                in _walky 0.
        in _walkx 0.)
;;
