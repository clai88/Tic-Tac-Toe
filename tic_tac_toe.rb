require 'pry'
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def print_board
    print "-----------\n"
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    print "-----------\n"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    print "-----------\n"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def valid?(index)
    p !@board[index]
  end
end

# a = TicTacToe.new.print_board
