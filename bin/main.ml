open LittleTown

let () =
  let board = Board.make_board (9, 6) in
  Board.set_tile board (0, 0) Board.mountain;
  Board.set_tile board (3, 0) Board.mountain;
  Board.set_tile board (7, 0) Board.mountain;
  Board.set_tile board (8, 0) Board.mountain;
  Board.set_tile board (2, 0) Board.forest;
  Board.set_tile board (5, 0) Board.lake;
  Board.print_board board 0
;;
