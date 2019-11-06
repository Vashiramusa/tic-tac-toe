#!/usr/bin/env ruby

# frozen_string_literal: true

puts 'Welcome to the Tic Tac Toe game!'
puts 'Rules for the game: '
puts '1. The game is played on a grid that is 3 squares by 3 squares.

2. You are X, your friend is O. Players take turns putting their marks in empty squares.

3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.

4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie. '
puts 'Player 1, what is your name?: '
player1 = gets.chomp
puts "Ok, #{player1} will you choose 'X' or 'O'?"
choice = gets.chomp
puts 'Player 2, what is your name?: '
player2 = gets.chomp
puts "#{player1} it's your turn: choose a number from the available squares"
# display current state of the board
puts '1 | 2 | 3'
puts '4 | 5 | 6'
puts '7 | 8 | 9'
move = gets.chomp
puts "#{player2} it's your turn: choose a number from the available squares"
# display current state of the board
puts 'X | 2 | 3'
puts '4 | 5 | 6'
puts '7 | 8 | 9'
move = gets.chomp
puts "#{player1} it's your turn: choose a number from the available squares"
# display current state of the board
puts 'X | 2 | 3'
puts '4 | O | 6'
puts '7 | 8 | 9'
move = gets.chomp
# the process is repeated until the board is full or a player wins
# In case one of the players wins:
puts "#{player1} You won!"
puts 'Score: '
puts "#{player1}: 3"
puts "#{player2}: 2"
puts 'Do you want to play again? yes/no: '
game_over = gets.chomp
