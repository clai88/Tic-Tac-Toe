require 'pry'
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    start
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

  def make_a_move
    i=0
    while true do
      player = i % 2 == 0 ? @p1 : @p2
      puts "Player #{player}! Make your move!"
      move = gets.chomp
      index = valid?(move)
      if valid?(move)
        player == @p1 ? @board[index] = "X": @board[index] = "O"
      else
        puts "Unfortunately, you have guessed an invalid square and wasted your turn."
      end
      i+=1
      print_board
      break unless won?
    end
  end

  def won?

  end

  def valid?(move)
    @valid_moves.index(move)
  end

  def start
    puts "Welcome! Let's play chess"
    puts "Player 1. Enter your name."
    @p1 = gets.chomp
    puts "Player 2. Enter your name."
    @p2 = gets.chomp
    fill_in_placeholders
    print_board
    make_a_move
  end
end

a = TicTacToe.new
# p a.valid?("0")
