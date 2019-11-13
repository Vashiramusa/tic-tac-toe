#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

game = true

puts 'Welcome to the Tic Tac Toe game!'
puts 'Rules for the game: '
puts '1. The game is played on a grid that is 3 squares by 3 squares.

2. You are X, your friend is O. Players take turns putting their marks in empty squares.

3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.

4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie. '

puts 'Player 1, what is your name?: '
name = gets.chomp
player1 = Player.new(name, 'x')
puts 'Player 2, what is your name?: '
name = gets.chomp
player2 = Player.new(name, 'o')
board = Board.new(player1, player2)
board.reset_board

while game
  if board.winner?
    puts board.display_board
    puts "Congratulations #{board.current_player.name} you have won!"
    game = false
  elsif board.draw?
    puts board.display_board
    puts 'It\'s a draw'
    game = false
  else
    puts "#{board.current_player.name} it's your turn: choose a number from the available squares"
    puts board.display_board
    move = gets.chomp
    puts board.register_move(move.to_i, board.current_player.symbol)
  end
end
