require './tic_tac_toe'

puts "Do you want to play against another person or against a computer?(p/c)"
answer = gets.chomp
if (answer == "p" || answer == "P")
  a = TicTacToe.new
  a.start
  a.fill_in_placeholders
  a.print_board
  a.make_a_move

elsif (answer == "c" || answer == "C")

else
  puts "not a valid option"
end
