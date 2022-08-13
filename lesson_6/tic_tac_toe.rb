# Tic tac toe. 3rd run.
# {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

require 'pry'

# Constants

PLAYER_MARKER = "X"
INITIAL_MARKER = " "
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +  # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +  # cols
                [[1, 5, 9], [3, 5, 7]]               # diag
MAX_WINS = 5

# Method Definitions

def prompt(msg)
  puts "=> #{msg}"
end

def welcome_message
  system "clear"
  prompt "Welcome to Tic-Tac Toe"
  puts ""
  sleep 1
  prompt "First to 5 wins is the champion!"
  puts ""
  sleep 1.5
  prompt "Press enter to begin."
  gets
end

# rubocop: disable Metrics/AbcSize, Layout/LineLength
def display_board(brd)
  system "clear"
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts "_________________"
  puts "*****************"
  puts "square key "
  puts ""
  puts " 1 | 2 | 3"
  puts "---+---+---"
  puts " 4 | 5 | 6"
  puts "---+---+---"
  puts " 7 | 8 | 9"
  puts ""
end

# def demo_board
#   puts ""
#   puts " 1 | 2 | 3"
#   puts "---+---+---"
#   puts " 4 | 5 | 6"
#   puts "---+---+---"
#   puts " 7 | 8 | 9"
#   puts ""
# end 

def show_scoreboard(score)
  puts ""
  puts "  PLAYER  |  COMPUTER  |  DRAWS  "
  puts "----------+------------+--------"
  puts "    #{score[:player_score]}     |      #{score[:computer_score]}     |    #{score[:draws]}    "
end
# rubocop: enable Metrics/AbcSize, Layout/LineLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = " " }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joiner(arr, delim = ", ", word = "or")
  case arr.size
  when 0 then ""
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delim)
  end
end

# rubocop: disable Metrics/MethodLength
def who_goes_first
  loop do
    prompt "Who would like to go first? (enter 1, 2, or 3)
              1. Me (user)
              2. Computer (opponent)
              3. Flip a coin."
    current_player = gets.chomp

    if ["1", "2", "3"].include?(current_player)
      case current_player.to_i
      when 1 then return "Player"
      when 2 then return "Computer"
      when 3 then return ["Player", "Computer"].sample
      end
    else
      prompt "Not a valid selection."
    end
  end
  current_player
end
# rubocop: enable Metrics/MethodLength

def places_marker!(brd, current_player)
  if current_player == "Player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_turn(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joiner(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

# rubocop: disable Layout/LineLength
def find_at_risk_square(line, brd, marker)
  if brd.values_at(line[0], line[1], line[2]).count(marker) == 2
    return brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
  nil
end
# rubocop: enable Layout/LineLength

# rubocop: disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick square 5
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  # random
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop: enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).all?(PLAYER_MARKER)
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).all?(COMPUTER_MARKER)
      return "Computer"
    end
  end
  nil
end

def increment_score(brd, score)
  case detect_winner(brd)
  when "Player"
    score[:player_score] += 1
  when "Computer"
    score[:computer_score] += 1
  else
    score[:draws] += 1
  end
end

def max_wins_reached?(score)
  score[:player_score] == MAX_WINS || score[:computer_score] == MAX_WINS
end

def five_time_winner(score)
  if score[:player_score] == MAX_WINS
    "Player"
  elsif score[:computer_score] == MAX_WINS
    "Computer"
  end
end

def congratulate_champ(score)
  case five_time_winner(score)
  when "Player"
    prompt "You've reached 5 wins. You are the champ!"
  when "Computer"
    prompt "Computer reached 5 wins. Computer is the champ!"
  end
end

def new_contest?(score)
  if max_wins_reached?(score)
    prompt "Would you like to start a new game? (yes or no) "
    answer = gets.chomp

    if %w(yes y).include?(answer.downcase)
      true
    else
      false
    end
  end
end

# Initialize score, board, current_player
welcome_message

loop do
  score = { player_score: 0, computer_score: 0, draws: 0 }

  loop do
    system "clear"
    board = initialize_board
    current_player = who_goes_first

    # Main game

    loop do
      display_board(board)
      show_scoreboard(score)
      places_marker!(board, current_player)
      current_player = alternate_turn(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    sleep 1.5

    increment_score(board, score)
    show_scoreboard(score)
    break if max_wins_reached?(score)
  end

  system "clear"
  show_scoreboard(score)
  congratulate_champ(score)
  sleep 1.5
  break unless new_contest?(score)
end

prompt "Thanks for playing Tic-Tac_Toe. See ya later!"
