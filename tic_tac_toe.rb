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
    while @board & @valid_moves != [] do
      player = i % 2 == 0 ? @p1 : @p2
      puts "Player #{player}! Make your move!"
      move = gets.chomp
      if valid?(move)
        index = @valid_moves.index(move.capitalize)
        player == @p1 ? @board[index] = "X ": @board[index] = "O "
      else
        puts "bad move"
      end
      i+=1
      print_board
      break if won?
    end
    if won?
      puts i%2 == 0 ? "#{@p2} wins" : "#{@p1} wins."
    else
      puts "Tie game!"
    end
    puts "do you wanna play again?(y/n)"
    gets.chomp == "y" ? start : nil
  end

  def valid?(move)
    @valid_moves.index(move.capitalize) && @board.include?(move)
  end

  def won?
    x = "X X X "
    o = "O O O "
    #horizontal
    [0,3,6].each do |i|
      j = ""
      [i,i+1,i+2].each {|k| j+= @board[k]}
      return true if j == x || j == o
      # diagonal
      j = ""
      [i,i+4,i+8].each {|k| j+= @board[k]} if i == 0
      return true if j == x || j == o
    end
    #vertical
    [0,1,2].each do |i|
      j = ""
      [i,i+3,i+6].each {|k| j+= @board[k]}
      return true if j == x || j == o
      # diagonal
      j = ""
      [i,i+2,i+4].each {|k| j+= @board[k]} if i == 2
      return true if j == x || j == o
    end
    return false
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
