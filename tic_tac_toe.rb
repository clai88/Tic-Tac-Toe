class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }

  end

  def board
  end

  def print_board
    row = [0,1,2]
    column = [0,1,2]

    row.each do |r|
      column.each do |c|
        @board[r][c] = ":)"
      end
    end
    print @board
  end
end

a = TicTacToe.new.print_board
