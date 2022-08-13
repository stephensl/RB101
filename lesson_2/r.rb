# Logic for rpsls game
require "pry"
VALID_CHOICES = {
                  "1" => { word: "rock", beats: ["3", "4" ] },
                  "2" => { word: "paper", beats: ["1", "5"] },
                  "3" => { word: "scissors", beats: ["2", "4"] },
                  "4" => { word: "lizard", beats: ["5", "2"] },
                  "5" => { word: "spock", beats: ["1", "3"] }
}

puts "choose 1, 2, 3, 4 or 5"
player_choice = gets.chomp

computer_choice = VALID_CHOICES.keys.sample


def win?(player, computer)
  VALID_CHOICES[player][:beats].include?(computer)
end 

def display_result(player, computer)
  if win?(player, computer)
    puts("You won!")
  elsif win?(computer, player)
    puts("Computer won!")
  else
    puts("It's a tie!")
  end
end

display_result(player_choice, computer_choice)

