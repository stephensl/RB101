# Giving it another round of walkthrough...

require "pry"

# Constants

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

# Methods
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
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
  puts ""
end

def show_scoreboard(score)
  puts ""
  puts "  PLAYER  |  COMPUTER  |  DRAW  "
  puts "----------+------------+--------"
  puts "    #{score[:player]}     |      #{score[:computer]}     |    #{score[:draw]}    "
end 
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0, draw: 0 }
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

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select {|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else 
    nil
  end 
end 

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joiner(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

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

# 5 square



# random_square 
  if !square
    square = empty_squares(brd).sample
  end 
  
  brd[square] = COMPUTER_MARKER
end 

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

def increment_score(score, brd)
  case detect_winner(brd)
    when "Player" then score[:player] += 1
    when "Computer" then score[:computer] += 1
    when nil then score[:draw] += 1
  end 
end 


score = initialize_score

loop do
  board = initialize_board  # {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
  
  
  loop do
    system "clear"
    display_board(board)
    show_scoreboard(score)
    
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  end

increment_score(score, board)

show_scoreboard(score)

  break if score[:player] == 5 || score[:computer] == 5
end

prompt "Thanks for playing Tic-Tac_Toe!"
