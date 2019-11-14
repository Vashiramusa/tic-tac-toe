# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

RSpec.describe Board do
  let(:player1) { Player.new('Vashira', 'x') }
  let(:player2) { Player.new('Mario', 'o') }
  let(:board) { Board.new(player1, player2) }

  describe '#initialize' do
    it 'should init an instance of the Board class' do
      expect(board).to be_an_instance_of(Board)
    end
  end

  describe '#reset_board' do
    it 'fills the empty elements of a new board with string numbers from 1 to 9' do
      board.reset_board
      expect(board.board).to eq((1.to_s..9.to_s).to_a)
    end
  end

  describe '#register_move' do
    it 'sets player 1 symbol in position 1 of the board' do
      board.register_move(1, player1.symbol)
      expect(board.board[0]).to eq('x')
    end
  end

  describe '#register_move' do
    it 'sets player 2 symbol in position 3 of the board' do
      board.register_move(3, player2.symbol)
      expect(board.board[2]).to eq('o')
    end
  end

  describe '#register_move' do
    context 'Invalid move (Board position occupied or option wrong)'
    it 'checks if the selected position is between 1-9, returns invalid input message if occupied or out of range' do
      expect(board.register_move(0, player2.symbol)).to eq('Invalid move, please try again!')
    end
  end

  describe '#current_player' do
    it 'displays the current players name based on instance variable @turn_count, player 1 if even, player2 if odd' do
      expect(board.current_player).to eql(player1)
    end

    it 'displays the current players name based on instance variable @turn_count, player 1 if even, player2 if odd' do
      board.register_move(5, player2.symbol)
      expect(board.current_player).to eql(player1)
    end
  end

  describe '#full?' do
    context 'Board not full'
    it 'Checks if all the positions in the board are occupied' do
      expect(board.full?).to eq(false)
    end

    context 'Board full'
    it 'Checks if all the positions in the board are occupied' do
      board.reset_board
      board.register_move(3, player1.symbol)
      board.register_move(2, player2.symbol)
      board.register_move(4, player1.symbol)
      board.register_move(1, player2.symbol)
      board.register_move(5, player1.symbol)
      board.register_move(6, player2.symbol)
      board.register_move(8, player1.symbol)
      board.register_move(7, player2.symbol)
      board.register_move(9, player1.symbol)
      expect(board.full?).to eq(true)
    end
  end

  describe '#draw?' do
    it 'Checks if there is a draw after all positions are occupied and no winner' do
      board.reset_board
      board.register_move(3, player1.symbol)
      board.register_move(2, player2.symbol)
      board.register_move(4, player1.symbol)
      board.register_move(1, player2.symbol)
      board.register_move(5, player1.symbol)
      board.register_move(6, player2.symbol)
      board.register_move(8, player1.symbol)
      board.register_move(7, player2.symbol)
      board.register_move(9, player1.symbol)
      expect(board.draw?).to eq(true)
    end
  end

  describe '#winner?' do
    context 'diagonal combination'
    it 'returns the winning combination with position - 1' do
      board.reset_board
      board.register_move(3, player1.symbol)
      board.register_move(5, player1.symbol)
      board.register_move(7, player1.symbol)
      expect(board.winner?).to eq([2, 4, 6])
    end
  end
end
