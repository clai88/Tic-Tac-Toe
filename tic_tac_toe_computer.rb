class TicTacToe
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
    puts "Welcome! Let's play chess"
    puts "Enter your name."
    @player = gets.chomp
  end

  def make_a_move
    i=0
    while @board & @valid_moves != [] do
      player = i % 2 == 0 ? @player : @p2
      puts "\nPlayer #{player}! Make your move!"

      while true do
        move = gets.chomp
        if valid?(move.capitalize)
          index = @valid_moves.index(move.capitalize)
          player == @player ? @board[index] = "X ": @board[index] = "O "
          break
        else
          puts "Bad move. Please guess again"
        end
      end
      i+=1
      print_board
      break if Won.won?(@board)
    end

    if Won.won?(@board)
      puts i%2 == 0 ? "#{@p2} wins" : "#{@player} wins."
    else
      puts "Tie game!"
    end
    puts "do you wanna play again?(y/n)"
    gets.chomp == "y" ? start : nil
  end

  def valid?(move)
    @valid_moves.index(move.capitalize) && @board.include?(move)
  end
end