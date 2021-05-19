# frozen_string_literal: true

require_relative 'display'
require_relative 'logics'

# Creates a new game!
class Game
  attr_accessor :first_game, :score

  include Display

  def initialize
    @name = nil
    @score = [0, 0]
    @logics = nil
    @first_game = true
  end

  def play
    welcome_msg if @score == [0, 0]
    @name = collect_player_name while @name.nil? || @name == ''
    start_new_round
  end

  private

  # collects player name
  def collect_player_name
    asking_name
    gets.chomp
  end

  # A draw that is sended to the screen when the game is started
  def welcome_msg
    welcome_output
  end

  # To start a single round of the game
  def start_new_round
    while @first_game || end?
      @first_game = false
      display_score(@score)
      @logics = Logics.new(@name)
      result = @logics.round
      update_score(result)
    end
  end

  def update_score(result)
    @score[0] += result[0]
    @score[1] += result[1]
  end

  def end?
    play_again_ask
    response = 'h'
    response = gets.chomp.downcase until ('yn').include?(response)
    response == 'y'
  end

end
