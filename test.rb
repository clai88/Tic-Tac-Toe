require "minitest/autorun"
require "minitest/pride"
require "./tic_tac_toe"
require "./won"
require "pry"

class TicTacToeTest < Minitest::Test

  def test_classes_exist
    assert TicTacToe
    assert Won
  end

  def test_empty_board
    a = TicTacToe.new
    assert_equal 9, a.board.count(" ")
  end

  def test_non_empty_board
    a = TicTacToe.new
    valid_moves = a.fill_in_placeholders
    assert_equal  valid_moves, a.board
  end

  def test_horizontal_win
    a = TicTacToe.new
    a.fill_in_placeholders
    assert_equal false, Won.won?(a.board)
    (3..5).each{|i| a.board[i] = "X "}
    assert_equal true, Won.won?(a.board)
  end

  def test_vertical_win
    a = TicTacToe.new
    a.fill_in_placeholders
    assert_equal false, Won.won?(a.board)
    [2,5,8].each{|i| a.board[i] = "X "}
    assert_equal true, Won.won?(a.board)
  end

  def test_diag_win
    a = TicTacToe.new
    a.fill_in_placeholders
    assert_equal false, Won.won?(a.board)
    [8,4,0].each{|i| a.board[i] = "O "}
    assert_equal true, Won.won?(a.board)
  end
end
