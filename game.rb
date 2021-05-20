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
    new_game_or_load
  end

  private

  def new_game_or_load
    choice = ' '
    display_new_game_or_load_msg
    choice = gets.chomp.downcase until 'ln'.include?(choice)
    start_new_round if choice == 'n'
    load_old_game if choice == 'l'
  end

  def load_old_game
    file_list = display_load_list
    number_of_game = gets.chomp until (1..file_list.size).include?(number_of_game.to_i)
    game_name = "scores/#{file_list[number_of_game.to_i - 1]}"
    @logics = Logics.new(game_name)
    @logics.loaded_game(game_name)
    start_new_round if end?
  end

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
