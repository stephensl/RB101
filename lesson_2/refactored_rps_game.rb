# Constants
require "yaml"
require "pry"
MESSAGES = YAML.load_file("rps_messages.yml")

VALID_CHOICES = { 
                  "1" => { word: "Rock", beats: ["3", "4"] },
                  "2" => { word: "Paper", beats: ["1", "5"] },
                  "3" => { word: "Scissors", beats: ["2", "4"] },
                  "4" => { word: "Lizard", beats: ["5", "2"] },
                  "5" => { word: "Spock", beats: ["3", "1"] }
}

# Method Definitions

def separator
  puts "------------------
------------------"
end

def prompt(string)
  puts "=> #{string}"
end

def messages(communication)
  MESSAGES[communication]
end

def retrieve_name(name)
  loop do
    name = gets.chomp
    break unless name.empty?
    prompt(messages("invalid_name"))
  end
  name
end

def review_rules
  review = gets.chomp
  clear_screen

  if review.downcase == "y" || review.downcase == 'yes'
    prompt(messages("display_rules"))
  else
    prompt(messages("no_rules"))
  end
end

def continue
  prompt(messages("continue"))
  gets
end

def clear_screen
  system("clear")
end

def choose_weapon(choice)
  loop do
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt(messages("invalid_choice"))
  end
  choice
end

def computer_choice
  VALID_CHOICES.keys.to_a.sample
end

def plyr_choice_to_word(choice)
  VALID_CHOICES[choice][:word]
end

def comp_choice_to_word(comp_choice)
  VALID_CHOICES[comp_choice][:word]
end

def display_choices(name, player_weapon, computer_weapon)
  prompt("#{name} chose #{player_weapon}")
  prompt("Computer chose #{computer_weapon}")
  prompt("Press 'ENTER' to see who wins!")
  gets
end

def win?(first, second)
  VALID_CHOICES[first][:beats].include?(second)
end

def display_winner(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
  prompt("Press 'ENTER' to move on to continue.")
  gets
end

def draw?(player, computer)
  !win?(player, computer) && !win?(computer, player)
end

def get_winner(player, computer)
  if win?(player, computer)
    :player
  elsif win?(computer, player)
    :computer
  elsif draw?(player, computer)
    :draw
  end
end

def increment_scoreboard(winner, overall_score)
  if winner == :player
    overall_score[:player] += 1
  elsif winner == :computer
    overall_score[:computer] += 1
  elsif winner == :draw
    overall_score[:draw] += 1
  end
  overall_score[:current_round] += 1
end

def display_score(player, computer, draw, current_round)
  prompt("**SCOREBOARD**")
  prompt("You: #{player}")
  prompt("Computer: #{computer}")
  prompt("Draws: #{draw}")
  prompt("Current Round: #{current_round}")
  prompt("Remember, first to 3 wins is crowned Champion!")
end

def crown_champ(overall_score)
  if overall_score[:player] == 3
    prompt("Congratulations! You are the Champion!")
  elsif overall_score[:computer] == 3
    prompt("Aww shucks..Computer is the Champion. You'll get 'em next time.")
  end
end

def play_again?
  answer = ""
  go_again = nil
  loop do
    answer = gets.chomp
    if answer.downcase == "y" || answer.downcase == "yes"
      go_again = true
      break
    elsif answer.downcase == "n" || answer.downcase == "no"
      go_again = false
      break
    else
      prompt(messages("again_error"))
    end
  end
  go_again
end

# Greeting & Rules

clear_screen

prompt(messages("welcome"))
sleep(1)

prompt(messages("get_name"))

name = retrieve_name(name)
clear_screen

prompt("Hi, #{name}")

prompt(messages("review_rules"))

review_rules

continue
clear_screen

# Gameplay Loop

loop do
  clear_screen

  overall_score = { player: 0, computer: 0, draw: 0, current_round: 1 }

  while overall_score[:player] < 3 && overall_score[:computer] < 3
    separator

    display_score(
      overall_score[:player],
      overall_score[:computer],
      overall_score[:draw],
      overall_score[:current_round]
    )

    separator

    prompt(messages("weapon_options"))

    choice = choose_weapon(choice)

    comp_choice = computer_choice

    player_weapon = plyr_choice_to_word(choice)

    computer_weapon = comp_choice_to_word(comp_choice)

    clear_screen

    display_choices(name, player_weapon, computer_weapon)

    clear_screen

    display_winner(choice, comp_choice)

    clear_screen

    winner = get_winner(choice, comp_choice)

    increment_scoreboard(winner, overall_score)

    separator
    display_score(
      overall_score[:player],
      overall_score[:computer],
      overall_score[:draw],
      overall_score[:current_round]
    )
    separator

    clear_screen

    crown_champ(overall_score)
  end

  prompt("Press 'ENTER' to see the final results.")
  gets

  separator
  display_score(
    overall_score[:player],
    overall_score[:computer],
    overall_score[:draw],
    overall_score[:current_round]
  )
  separator

  prompt(messages("replay"))

  break unless play_again?
end

prompt(messages("goodbye"))
