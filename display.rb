# frozen_string_literal: true

# Module that return the different outputs to the command line tool
module Display

  # Answer player's name
  def asking_name
    puts "What's your name?"
    print '=>   '
  end

  # Say the player welcome to the game
  def welcome_output
    hangman_title = File.read('./ascii_imgs/HangmanLogo.txt')
    hangman_logo = File.read('./ascii_imgs/hangman_guy.txt')
    puts 'Welcome to...'
    puts hangman_title, "\n"
    puts hangman_logo, "\n"
  end

  def show_game_state(player_word, tries)
    hangman_turn = File.read("./ascii_imgs/instances/#{tries}.txt")
    puts hangman_turn, "\n"
    puts "===>   #{player_word.join(' ')} (#{player_word.size})"
  end

  def pick_letter_display
    puts "Pick your next guess or enter 'save' to save the game"
    print '==> '
    true
  end

  def display_game_to_save
    puts 'Enter a name for this game:'
    print '==>  '
  end

  def display_winner(name)
    puts "Contratulations, #{name}. You won the game!"
  end

  def display_loser(name, word)
    puts "You lose, #{name}. The word was #{word}"
  end

  def letter_found
    puts 'Letter found!'
  end

  def play_again_ask
    puts "Do you want to play again? 'y': yes, 'n': no"
  end

  def display_new_game_or_load_msg
    puts 'What do you want to do? (n)ew game | (l)oad game'
  end

  def display_load_list
    puts 'Saved games list'
    file_list = Dir.entries('scores').select do |file|
      file if file.include?('.yaml')
    end
    file_list.each_with_index do |file, idx|
      puts "#{idx + 1} --> #{file[0..-6]}"
    end
    print 'Game to load ==> #'
    file_list
  end

end
