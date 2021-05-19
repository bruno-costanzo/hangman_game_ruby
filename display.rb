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
    hangman_logo = File.read('./ascii_imgs/Hangman_guy.txt')
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
    puts 'Pick your next guess: '
    print '==> '
    true
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

  def display_score(score)
    puts "SCORE ==> You: #{score[0]}, Computer = #{score[1]}"
  end
end
