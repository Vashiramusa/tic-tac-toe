# frozen_string_literal: true

class Board
  attr_reader :board, :player1, :player2

  WINNING_COMBINATIONS = [
    [0, 4, 8],
    [2, 4, 6],
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ].freeze

  def initialize(player1, player2)
    @board = Array.new(9)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def winner?
    WINNING_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
        @board[combination[1]] == @board[combination[2]]
    end
  end

  def full?
    @turn_count == 9
  end

  def draw?
    !winner? && full?
  end

  def current_player
    player = if (@turn_count % 2).zero?
               @player1
             else
               @player2
             end
    player
  end

  def reset_board
    9.times { |i| @board[i] = (i + 1).to_s }
  end

  def display_board
    lines = '========='
    "#{lines}\n" \
    "#{board[0]} | #{board[1]} | #{board[2]}\n" \
    "---------\n" \
    "#{board[3]} | #{board[4]} | #{board[5]}\n" \
    "---------\n" \
    "#{board[6]} | #{board[7]} | #{board[8]}\n" \
    "#{lines}"
  end

  def register_move(position, symbol)
    if valid_move?(position)
      @board[position - 1] = symbol
      @turn_count += 1 unless winner?
    else
      'Invalid move, please try again!'
    end
  end

  private

  def position_taken?(position)
    @board[position - 1] == 'x' || @board[position - 1] == 'o'
  end

  def valid_move?(position)
    position.between?(1, 9) && !position_taken?(position)
  end
end
