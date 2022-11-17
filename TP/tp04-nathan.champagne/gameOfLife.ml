#use "topfind";;
#require "graphics";;
#use "list_tools.ml";;

let cell_size = 10;;

let rules0 cell near =
  if near = 3 && cell = empty then new_cell
  else if (near = 2 || near = 3) && cell = new_cell then cell
  else empty
;;


let count_neighbours (x, y) board (size: int) =
  let rec _count (ix, iy) l=
    (*si la ligne actuelle est apres le lot de cellule que l'on cherche alors on arrete de chercher*)
    if ix > x+1 then 0
    else match l with
      (*si la ligne actuelle est avant le lot de cellule que l'on cherche alors on passe directememt a celle d'apres*)
      |l::board when ix < x-1 -> _count (ix+1, 0) board
      |[] -> 0
      |[]::board -> _count (ix+1, 0) board
      |(e::l)::board ->
        (*si la case que l'on regarde est apres les cases que l'on cherche alors on passe a la ligne suivante*)
        (
          if iy > y+1 then _count (ix+1, 0) board
          (*si la case passe au voisinage de la cellule alors on l'ajoute (donc +1 si vivante)*)
          else if (x-1 <= ix && ix <= x+1) &&
                  (y-1<=iy && iy <= y+1) &&
                  (ix<>x || iy <>y)
          then  e + _count (ix, iy+1) (l::board)
          (*Dans les autres cas passer a la case suivante sans rien ajouter*)
          else _count (ix, iy+1) (l::board)
        )
  in _count (0, 0) board
;;


let seed_life board size nb_cell =
  if nb_cell > size*size then invalid_arg "seed_life: Too many nb_cell in this board"
  else let rec _seed_life board nb_cell =
         if nb_cell <= 0 then board
         else let x = Random.int size and y = Random.int size in
           if get_cell (x, y) board = 0 then _seed_life (put_cell new_cell (x, y) board) (nb_cell - 1)
           (*si la cellule est deja vivante alors on recommence avec les mêmes parametres pour arriver a une cellule morte*)
           else _seed_life board nb_cell
    in (Random.self_init ();_seed_life board nb_cell) (*On reinitialise l'aléatoire et on lance la recursion*)
;;


let new_board size nb_cell = seed_life (init_board (size, size) empty) size nb_cell;;


let next_generation board size =
  let rec _next (ix, iy) old_board =
    match old_board with
    |[] -> []
    |l::old_b -> let rec _next_el (ix, iy) l = match l with
        |[]-> []
        |e::l -> let new_cell = rules0 e (count_neighbours (ix, iy) board size) in
          (*Si la nouvelle cellule est dans le même etat que la dernière alors on ne fait rien sinon en affiche le nouvel etat*)
          ((if e=new_cell then () else draw_cell (ix, iy) cell_size (cell_color new_cell)); new_cell::_next_el (ix, iy+1) l)
      in (_next_el (ix, iy) l)::_next (ix+1, 0) old_b
  in _next (0, 0) board
;;


let game board size n =
  (open_window (size * cell_size + 40);
   clear_graph ();
   (*pour afficher une premiere fois la grille en entière car apres seul celle qui change seront affichees*)
   draw_board board cell_size;
   let rec _game board n =
     if n = 0 then ()
     else (_game (next_generation board size) (n-1))
   in _game board n)
;;


let new_game size nb_cell n = game (new_board size nb_cell) size n;;
