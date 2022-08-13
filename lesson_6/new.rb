# # # def player_places_piece!(brd)
# # #   square = ''
# # #   loop do
# # #     prompt "Choose a square (#{joiner(empty_squares(brd))}"
# # #     square = gets.chomp.to_i
# # #     break if empty_squares(brd).include?(square)
# # #     prompt "Sorry, not a valid choice"
# # #   end

# # #   brd[square] = PLAYER_MARKER
# # # end



# # # def joiner(arr, delim = ", ", word = "or")
# # #   case arr.size
# # #   when 0 then ""
# # # #   when 1 then arr.first
# # # #   when 2 then arr.join(" #{word} ")
# # # #   else
# # # #     arr[-1] = "#{word} #{arr.last}"
# # # #     arr.join(delim)
# # # #   end 
# # # # end 


# # # score = {player_score: 0, computer_score: 0, draws: 0}

# # # # def increment_score(brd, score)
# # # #   if detect_winner(brd) == "Player"
# # # #     score[:player_score] += 1
# # # #   elsif detect_winner(brd) == "Computer"
# # # #     score[:computer_score] += 1
# # # #   else 
# # # #     score[:draws] += 1
# # # #   end 
# # # # end




# # # def show_scoreboard(score)
# # #   puts ""
# # #   puts "  PLAYER  |  COMPUTER  |  DRAWS  "
# # #   puts "----------+------------+--------"
# # #   puts "    #{score[:player_score]}     |      #{score[:computer_score]}     |    #{score[:draws]}    "
# # # end 

# # # show_scoreboard(score)

# # def max_wins_reached?(score)
# #   score[:player_score] == MAX_WINS || score[computer_score] == MAX_WINS
# # end 

# # def five_time_winner(score)
# #   if score[:player_score] == 5 
# #     return "Player"
# #   elsif score[computer_score] == 5
# #     return "Computer"
# #   else 
# #     return nil 
# #   end 
# # end 

# # def get_champ(score)
# #   if five_time_winner(score) == "Player"
# #     prompt "You've reached 5 wins. You are the champ!"
# #   elsif five_time_winner(score) == "Computer"
# #     prompt "Computer reached 5 wins. Computer is the champ!"
# #   end 
# # end 
  
  
# # def new_contest?(score)
# #   if max_wins_reached?(score)
# #     prompt "#{five_time_winner(score)} won this time. Would you like to start a new game? (y or n) "
# #     answer = gets.chomp 
# #     break unless answer.downcase.start_with?('y')
# #   else 
# #     prompt "Press 'enter' to go to the next round. Type 'exit' to leave game. "
# #     answer = gets.chomp
# #     break if answer.downcase == "exit"
# #   end 
# # end 

# require 'pry'
# WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +  # rows
#                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +  # cols
#                 [[1, 5, 9], [3, 5, 7]]               # diag
# MAX_WINS = 5

# board = {1=>"X", 2=>" ", 3=>" ", 4=>"X", 5=>" ", 6=>" ", 7=>"X", 8=>" ", 9=>" "}
    
# def find_at_risk_square(line, brd, marker)
#   if brd.values_at(line[0], line[1], line[2]).count(marker) == 2
#     brd.select {|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
#   else
#     nil
#   end 
# end 
 
  

# # find_at_risk_square(board)
# require 'pry'

# def who_goes_first?
#   puts "Choose who goes first: choose 1, 2, or 3:
#           1) Player
#           2) Computer
#           3) Random"
#   first_to_play = gets.chomp.to_i
  
#   case first_to_play
#     when 1 then return "Player"
#     when 2 then return "Computer"
#     when 3 then return %w(Player Computer).sample
#   end
# end 
  
# current_player = who_goes_first?

# puts current_player

def prompt(msg)
  puts ">> #{msg}"
end 

def who_goes_first()
  prompt "Who would like to go first? (enter 1, 2, or 3)
            1. Me (user)
            2. Computer (opponent)
            3. Flip a coin."
  current_player = gets.chomp

  case current_player.to_i
    when 1 then return "Player"
    when 2 then return "Computer"
    when 3 then return ["Player", "Computer"].sample
  end 
  current_player
end 
  
def alternate_turn(current_player)
  current_player = current_player == "Player" ? "Computer" : "Player"
end 

def places_marker(brd, current_player)
  current_player == "Player" ? player_places_piece!(brd) : computer_places_piece!(brd)
end 
  
