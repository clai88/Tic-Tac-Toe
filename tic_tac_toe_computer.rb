require './tic_tac_toe'

# tictactoe computer class
class TicTacToeComputer < TicTacToe
  def start
    puts "Welcome! Let's play tic tac toe"
    puts 'Enter your name.'
    @player = gets.chomp
  end

  def make_a_move
    i = 0
    while @board & @valid_moves != []
      if i.even?
        puts "\nPlayer #{@player}! Make your move!"
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
      puts i.even? ? 'Computer wins
        .---.__
       /  /6|__\
       \  \/--`
       /  \\
      /    )\
     /  _.\' /
    //~`\\-\'
 =====//===(=))========= '


      : "#{@player} wins."
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
    valid_indeces.include?(4) ? 4 : smart_move(valid_indeces)
  end

  def smart_move(valid_indeces)
    # try_to_win(valid_indeces, "O ")
    valid_indeces.each do |i|
      play_board = @board.dup
      play_board[i] = "O "
      return i if Won.winner?(play_board)
    end

    valid_indeces.each do |i|
      play_board = @board.dup
      play_board[i] = "X "
      return i if Won.winner?(play_board)
    end
    return check_tricky_corner(valid_indeces) != [] ? check_tricky_corner(valid_indeces): valid_indeces.sample
  end

  def try_to_win(available,piece)
    available.each do |i|
      play_board = @board.dup
      play_board[i] = piece
      return i if Won.winner?(play_board)
    end
  end

  def check_tricky_corner(valid_indeces)
    if @board[0] == 'X ' && @board[8] ||
       @board[2] == 'X ' && @board[6]
      return ([1, 3, 5, 7] & valid_indeces).sample
    end
    []
  end
end
