require './tic_tac_toe'

class TicTacToeComputer < TicTacToe

  def start
    puts "Welcome! Let's play tic tac toe"
    puts 'Enter your name.'
    @player = gets.chomp
  end

  def make_a_move
    i = 0
    while @board & @valid_moves != []
      puts "\nPlayer #{@player}! Make your move!"
      if i.even?
        loop do
          move = gets.chomp
          if valid?(move.capitalize)
            index = @valid_moves.index(move.capitalize)
            @board[index] = 'X '
            break
          else
            puts 'Bad move. Please guess again'
          end
        end
      else
        @board[computer_move] = 'O '
        puts 'Computer Moved'
      end
      i += 1
      PrintBoard::print_board(@board)
      break if Won.winner?(@board)
    end

    if Won.winner?(@board)
      puts i.even? ? 'Computer wins' : "#{@player} wins."
    else
      puts 'Tie game!'
    end
  end

  def computer_move
    valid_indeces = []
    for i in (0...@board.length)
      unless @board[i] == 'X '
        valid_indeces.push(i) unless @board[i] == 'O '
      end
    end
    valid_indeces.include?(4) ? 4 : valid_indeces.sample
  end
end
