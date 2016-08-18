require './tic_tac_toe'
require './tic_tac_toe_computer'
require './board'

puts "Do you want to play against another person or against a computer?(p/c)"
answer = gets.chomp
if (answer == "p" || answer == "P")
  b = Board.new
  b.fill_in_placeholders
  a = TicTacToe.new(b.board,b.valid_moves)
  a.start
  PrintBoard::print_board(a.board)
  a.make_a_move
elsif (answer == "c" || answer == "C")
  a = TicTacToeComputer.new
  a.start
  a.fill_in_placeholders
  a.print_board
  a.make_a_move
else
  puts "not a valid option"
end
