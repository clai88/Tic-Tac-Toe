class TicTacToeComputer
  attr_reader :board
  def initialize
    @board = Array.new(9, " ")
  end

  def fill_in_placeholders
    for i in (0..9)
      case i
      when 0..2
        @board[i] = "A#{i + 1}"
      when 3..5
        @board[i] = "B#{i - 2}"
      when 6..8
        @board[i] = "C#{i - 5}"
      end
    end
    @valid_moves = @board.map{|x| x}
  end
  def print_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    print "-------------\n"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    print "-------------\n"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def start
    puts "Welcome! Let's play ttt"
    puts "Enter your name."
    @player = gets.chomp
  end

  def make_a_move
    i=0
    while @board & @valid_moves != [] do
      puts "\nPlayer #{@player}! Make your move!"
      if i % 2 == 0
        while true do
          move = gets.chomp
          if valid?(move.capitalize)
            index = @valid_moves.index(move.capitalize)
            @board[index] = "X "
            break
          else
            puts "Bad move. Please guess again"
          end
        end
      else
        @board[computer_move] = "O "
        puts "Computer Moved"
      end
      i+=1
      print_board
      break if Won.won?(@board)
    end

    if Won.won?(@board)
      puts i%2 == 0 ? "Computer wins" : "#{@player} wins."
    else
      puts "Tie game!"
    end
  end

  def valid?(move)
    @valid_moves.index(move.capitalize) && @board.include?(move)
  end

  def computer_move
    valid_indeces = []
    for i in (0...@board.length)
      unless @board[i] == "X "
        unless @board[i] == "O "
          valid_indeces.push(i)
        end
      end
    end
    return valid_indeces.include?(4) ? 4 : valid_indeces.sample
  end
end
