# frozen_string_literal: true

require_relative '../lib/player.rb'

RSpec.describe Player do
  let(:player1) { Player.new('Vashira', 'x') }
  let(:player2) { Player.new('Mario', 'o') }

  describe '#initialize' do
    it 'assigns name to new player 1' do
      expect(player1.name).to eql('Vashira')
    end

    it 'assigns symbol to new player 1' do
      expect(player1.symbol).to eql('x')
    end

    it 'assigns name to new player 2' do
      expect(player2.name).to eql('Mario')
    end

    it 'assigns symbol to new player 2' do
      expect(player2.symbol).to eql('o')
    end
  end
end
