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

  def start
    puts "Welcome! Let's play chess"
    puts "Player 1. Enter your name."
    @p1 = gets.chomp
    puts "Player 2. Enter your name."
    @p2 = gets.chomp
    fill_in_placeholders
    print_board
  end

  def make_a_move
    while true do
      "Player #{@p1}! Make your move!"
      move = gets.chomp


      "Player #{@p2}! Make your move!"
    end
  end

  def won?
    true
  end

  def valid?(index)
    return false unless index.to_i.to_s==index
    index = index.to_i
    square = @board[index]
    @valid_moves.include?(square)? true : false
  end
end

a = TicTacToe.new
p a.valid?("0")
