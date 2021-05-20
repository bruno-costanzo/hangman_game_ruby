# frozen_string_literal: true

require 'yaml'

# Module that return the different outputs to the command line tool
module Database
  def save_game
    display_game_to_save
    @game_name = gets.chomp
    creting_game_file
  end

  def load_from_yaml(filename)
    file = YAML.safe_load File.read(filename)
    binding_setter(file)
  end

  def binding_setter(file)
    @word = file['word']
    @tries = file['tries']
    @player_name = file['player_name']
    @player_word_array = file['player_word_array']
    @letters_already_used = file['letters_already_used']
  end

  def creting_game_file
    fname = "scores/#{@game_name}.yaml"
    file = File.open(fname, 'w')
    file.write save_to_yaml
  end

  def save_to_yaml
    YAML.dump(
      'word' => @word,
      'player_name' => @player_name,
      'tries' => @tries,
      'player_word_array' => @player_word_array,
      'letters_already_used' => @letters_already_used
    )
  end
end
