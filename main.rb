# frozen_string_literal: true

require_relative 'game'

def game_starter
  game = Game.new
  game.play
end

game_starter