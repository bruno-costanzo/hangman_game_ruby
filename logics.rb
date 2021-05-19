# frozen_string_literal: true

require_relative 'display'

# This class have the methods to play a single round of the game
class Logics
  attr_accessor :player_word, :score

  include Display

  def initialize(name)
    @words_file = File.readlines('5desk.txt')
    @word = @words_file.sample[0..-2].downcase
    @score = [0, 0]
    @player_name = name
    @player_word_array = nil
    @tries = 7
    @letters_already_used = []
  end

  def round
    @player_word_array = create_player_word(@word)
    until winner?
      show_game_state(@player_word_array, @tries)
      player_pick_letter
    end
    @score
  end

  private

  # Create full '_' word with the size of the original word
  def create_player_word(word)
    Array.new(word.length, '_')
  end

  # Check if the word of the usser is equal to the original word
  def winner?
    if @player_word_array.join == @word
      @score = [1, 0]
      winner_msg
      true
    elsif @tries.zero?
      @score = [0, 1]
      loser_msg
      true
    else
      false
    end
  end

  def winner_msg
    show_game_state(@player_word_array, @tries)
    display_winner(@player_name)
  end

  def loser_msg
    show_game_state(@player_word_array, @tries)
    display_loser(@player_name, @word)
  end

  def player_pick_letter
    letter = nil
    pick_letter_display && letter = gets.chomp.downcase until
    !@letters_already_used.include?(letter) && ('a'..'z').to_a.include?(letter)
    @letters_already_used << letter
    letter_checker(letter)
  end

  def letter_checker(letter)
    if @word.include?(letter)
      letter_found
      @word.split('').each_with_index do |char, idx|
        @player_word_array[idx] = char if char == letter
      end
    else
      @tries -= 1
    end
  end
end
