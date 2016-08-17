class Won
  def self.won?(board)
    x = "X X X "
    o = "O O O "
    #horizontal
    [0,3,6].each do |i|
      j = ""
      [i,i+1,i+2].each {|k| j+= board[k]}
      return true if j == x || j == o
      # diagonal
      j = ""
      [i,i+4,i+8].each {|k| j+= board[k]} if i == 0
      return true if j == x || j == o
    end
    #vertical
    [0,1,2].each do |i|
      j = ""
      [i,i+3,i+6].each {|k| j+= board[k]}
      return true if j == x || j == o
      # diagonal
      j = ""
      [i,i+2,i+4].each {|k| j+= board[k]} if i == 2
      return true if j == x || j == o
    end
    return false
  end
end