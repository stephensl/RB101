VALID_CHOICES = {
                  "1" => { word: "rock", beats: ["3", "4" ] },
                  "2" => { word: "paper", beats: ["1", "5"] },
                  "3" => { word: "scissors", beats: ["2", "4"] },
                  "4" => { word: "lizard", beats: ["5", "2"] },
                  "5" => { word: "spock", beats: ["1", "3"] }
}

def prompt(message)
  puts "=> #{message}"
end

def first_beats_second?(first, second)
  VALID_CHOICES[first][:beats].include?(second)
end 

def draw?(player, computer)
  !first_beats_second(player, computer) && !first_beats_second(computer, player)
end

def get_round_winner(player, computer)
  if first_beats_second?(player, computer)
    :player
  elsif first_beats_second?(computer, player)
    :computer
  elsif draw?(player, computer)
    :draw
  end
end

def display_winner(player, computer)
  if first_beats_second?(player, computer)
    prompt("You won!")
  elsif first_beats_second?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_scoreboard(player_score, computer_score, draws, current_round)
  prompt("**SCOREBOARD**")
  prompt("Player: #{player_score}")
  prompt("Computer: #{computer_score}")
  prompt("Draws: #{draws}")
  prompt("Round: #{current_round}")
  prompt("Remember, first to three wins is champion!")
end 

def increment_scoreboard(round_winner, scoreboard)
  if round_winner == :player
    scoreboard[:player] += 1
  elsif round_winner == :computer
    scoreboard[:computer] += 1
  elsif round_winner == [:draw]
    scoreboard[:draw] += 1
  end 
  scoreboard[:current_round] += 1
end 


  
  
loop do
  player_choice = nil
  
  scoreboard = {player: 0, computer: 0, draws: 0, current_round: 1}
  display_scoreboard(
    scoreboard[:player],
    scoreboard[:computer],
    scoreboard[:draws],
    scoreboard[:current_round]
    )
  
  while scoreboard[:player] < 3 && scoreboard[:computer] < 3
    prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
    player_choice = gets.chomp

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("Not a valid choice.")
    end
  

  computer_choice = VALID_CHOICES.keys.sample

  puts "You chose: #{player_choice}. Computer chose: #{computer_choice}"

  round_winner = get_round_winner(player_choice, computer_choice)
  
  display_winner(player_choice, computer_choice)
  
  increment_scoreboard(round_winner, scoreboard)
  

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
  end
end 

prompt("Thanks for playing!")

