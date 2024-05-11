type resource =
  | Fish of int
  | Wheat of int
  | Wood of int
  | Stone of int
  | Gold of int

type builder =
  | White
  | Orange
  | Purple
  | Red

type building =
  { cost : resource list
  ; victory_points : int
  ; char : char
  ; owner : builder option
  }

let fountain =
  { cost = [ Stone 2 ]
  ; victory_points = 5
  ; char = 'f'
  ; owner = None
  }
;;

type tile =
  { building : building option
  ; resource : resource option
  ; builder : builder option
  }

let make_tile building resource builder =
  { building; resource; builder }
;;

type board =
  { size : int * int
  ; matrix : tile array array
  }

let make_board size =
  match size with
  | x, y ->
    let t = make_tile None None None in
    { size = x, y; matrix = Array.make_matrix x y t }
;;
