def initialize
  @board = Array.new(9, ' ')
end

def fill_in_placeholders
  9.times do |i|
    case i
    when 0..2
      @board[i] = "A#{i + 1}"
    when 3..5
      @board[i] = "B#{i - 2}"
    when 6..8
      @board[i] = "C#{i - 5}"
    end
  end
  @valid_moves = @board.map { |x| x }
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
  puts 'Player 1. Enter your name.'
  @p1 = gets.chomp
  puts 'Player 2. Enter your name.'
  @p2 = gets.chomp
end
