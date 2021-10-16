# Build Rock, Paper, Scissors, Lizard, Spock Game.
# Player vs Computer- first to win 3 games is champion.

=begin
Welcome user to game.
Ask user to enter name.
Greet user.
Ask if user would like to review the rules (yes/no).
  if yes, display rules
    prompt user to press 'enter' to begin game.
  if no, prompt user to press enter to begin game.
Display scoreboard and "First to 3 victories is champion"
Prompt user to choose weapon from list.
Validate user weapon choice.
Gather computer weapon choice.
Dispay user and computer choice
Compare user choice vs computer choice.
Declare winner of the round.
Display scoreboard with user/computer scores.
Continue next round- until user or computer wins 3 games.
When user or computer wins 3 games, declare champion.
Ask if user would like to play again (yes/no)
  if yes- play again
  if no- exit
Display goodbye message.
=end

# Constants
require "yaml"
require "pry"
MESSAGES = YAML.load_file("rps_messages.yml")

VALID_CHOICES = { "1" => "Rock",
                  "2" => "Paper",
                  "3" => "Scissors",
                  "4" => "Lizard",
                  "5" => "Spock" }

WINNING_COMBOS = { "1" => { defeats: ["3", "4"] },
                   "2" => { defeats: ["1", "5"] },
                   "3" => { defeats: ["2", "4"] },
                   "4" => { defeats: ["5", "2"] },
                   "5" => { defeats: ["3", "1"] } }

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
  VALID_CHOICES[choice]
end

def comp_choice_to_word(comp_choice)
  VALID_CHOICES[comp_choice]
end

def display_choices(name, player_weapon, computer_weapon)
  prompt("#{name} chose #{player_weapon}")
  sleep(1)
  prompt("Computer chose #{computer_weapon}")
  sleep(1)
end

def win?(first, second)
  WINNING_COMBOS[first][:defeats].include?(second)
end

def display_winner(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

def get_winner(player, computer)
  if win?(player, computer)
    :player
  elsif win?(computer, player)
    :computer
  end
end

def increment_score(winner, overall_score)
  if winner == :player
    overall_score[:player] += 1
  elsif winner == :computer
    overall_score[:computer] += 1
  end
end

def display_score(player, computer)
  prompt("**SCOREBOARD**")
  prompt("You: #{player}")
  prompt("Computer: #{computer}")
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
  overall_score = { player: 0, computer: 0 }

  while overall_score[:player] < 3 && overall_score[:computer] < 3
    separator

    display_score(overall_score[:player], overall_score[:computer])

    separator

    prompt(messages("weapon_options"))

    choice = choose_weapon(choice)

    comp_choice = computer_choice

    player_weapon = plyr_choice_to_word(choice)

    computer_weapon = comp_choice_to_word(comp_choice)

    clear_screen

    display_choices(name, player_weapon, computer_weapon)
    sleep(1)

    display_winner(choice, comp_choice)
    sleep(2)
    clear_screen

    winner = get_winner(choice, comp_choice)

    increment_score(winner, overall_score)

    separator
    display_score(overall_score[:player], overall_score[:computer])
    separator

    clear_screen

    crown_champ(overall_score)

  end

  sleep(3)

  separator
  display_score(overall_score[:player], overall_score[:computer])
  separator
  sleep(2)

  prompt(messages("replay"))

  break unless play_again?
end

prompt(messages("goodbye"))
