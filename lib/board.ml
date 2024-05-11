type resource =
  | Fish of int
  | Wheat of int
  | Wood of int
  | Stone of int
  | Gold of int

let string_of_resource resource =
  match resource with
  | Fish _ -> "L"
  | Wheat _ -> "F"
  | Wood _ -> "W"
  | Stone _ -> "M"
  | _ -> assert false
;;

type colour =
  | White
  | Orange
  | Purple
  | Red

type building =
  { cost : resource list
  ; victory_points : int
  ; char : char
  ; owner : colour option
  }

let fountain =
  { cost = [ Stone 2 ]
  ; victory_points = 5
  ; char = 'f'
  ; owner = None
  }
;;

let occupy_building building colour =
  { building with owner = Some colour }
;;

type tile =
  { building : building option
  ; resource : resource option
  ; occupier : colour option
  }

let make_tile building resource occupier =
  { building; resource; occupier }
;;

let tile_char tile =
  match tile with
  | { building = Some x; _ } -> String.make 1 x.char
  | { resource = Some x; _ } -> string_of_resource x
  | { occupier = Some _; _ } -> "o"
  | _ -> "."
;;

let mountain =
  { building = None
  ; resource = Some (Stone 1)
  ; occupier = None
  }
;;

let forest =
  { building = None
  ; resource = Some (Wood 1)
  ; occupier = None
  }
;;

let lake =
  { building = None
  ; resource = Some (Fish 1)
  ; occupier = None
  }
;;

type board =
  { size : int * int
  ; matrix : tile array array
  }

let make_board size =
  match size with
  | x, y ->
    let tile = make_tile None None None in
    { size = x, y; matrix = Array.make_matrix y x tile }
;;

let set_tile board coordinates tile =
  match coordinates with
  | x, y -> board.matrix.(y).(x) <- tile
;;

let print_row row =
  let characters =
    Array.map (fun tile -> tile_char tile) row
  in
  print_endline
    (Array.to_list characters |> String.concat " ")
;;

let rec print_board board row =
  if row < snd board.size
  then (
    print_row board.matrix.(row);
    print_board board (row + 1))
;;
