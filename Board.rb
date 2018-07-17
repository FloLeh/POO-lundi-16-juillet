require_relative 'BoardCase'

class Board
  attr_accessor :board

  def initialize(board=[])
    @board = board
    9.times do
      board << BoardCase.new().form
    end
  end

  def show_board
    puts "\n   1   2   3"
    p '1 ' + board[0..2].join(' | ') + ' '
    p " ---|---|---"
    p '2 ' + board[3..5].join(' | ') + ' '
    p " ---|---|---"
    p '3 ' + board[6..8].join(' | ') + ' '
    puts "\n"
  end

  def full(boards)
    !boards.include?(' ')
  end

  def game_over
    ([board[0], board[1], board[2]].uniq.size == 1 && [board[0], board[1], board[2]].uniq != [' ']) ||
    ([board[3], board[4], board[5]].uniq.size == 1 && [board[3], board[4], board[5]].uniq != [' ']) ||
    ([board[6], board[7], board[8]].uniq.size == 1 && [board[6], board[7], board[8]].uniq != [' ']) ||
    ([board[0], board[3], board[6]].uniq.size == 1 && [board[0], board[3], board[6]].uniq != [' ']) ||
    ([board[1], board[4], board[7]].uniq.size == 1 && [board[1], board[4], board[7]].uniq != [' ']) ||
    ([board[2], board[5], board[8]].uniq.size == 1 && [board[2], board[5], board[8]].uniq != [' ']) ||
    ([board[0], board[4], board[8]].uniq.size == 1 && [board[0], board[4], board[8]].uniq != [' ']) ||
    ([board[2], board[4], board[6]].uniq.size == 1 && [board[2], board[4], board[6]].uniq != [' '])
  end


end
