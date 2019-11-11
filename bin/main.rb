#!/usr/bin/env ruby

# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9)
  end

  def reset_board
    9.times { |i| @board[i] = (i + 1).to_s }
  end

  def display_board
    puts '=========='
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '__________'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '__________'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts '=========='
  end

  def register_move(position, symbol)
    if valid_move?(position)
      @board[position - 1] = symbol
    else
      puts 'Invalid move, please try again!'
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
game = true

puts 'Welcome to the Tic Tac Toe game!'
puts 'Rules for the game: '
puts '1. The game is played on a grid that is 3 squares by 3 squares.

2. You are X, your friend is O. Players take turns putting their marks in empty squares.

3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.

4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie. '
puts 'Player 1, what is your name?: '
player1 = gets.chomp
puts 'Player 2, what is your name?: '
player2 = gets.chomp
board = Board.new
board.reset_board

loop do
  puts "Ok, #{player1} will you choose 'X' or 'O'?"
  # get user input
  choice = gets.chomp
  choice.include?('x' || 'o') ? break : (puts 'invalid input, please try again')
end

current_player = player1
while game
  puts "#{current_player} it's your turn: choose a number from the available squares"
  # display current state of the board
  board.display_board
  # get user input
  move = gets.chomp
  board.register_move(move.to_i, 'x')
  # Let the user know if the input is invalid

  current_player = if current_player == player1
                     player2
                   else
                     player1
                   end

  if move == 'win'
    puts "Congratulations #{current_player} you have won!"
    game = false
  elsif move == 'draw'
    puts 'Is a draw'
    game = false
  end
end
