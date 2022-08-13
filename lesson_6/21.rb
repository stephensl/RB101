require 'pry'
require 'yaml'
CARD_SUITS = %w(HEARTS SPADES CLUBS DIAMONDS)
CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 JACK QUEEN KING ACE)
MAX_WINS = 5
TARGET_VALUE = 21
DEALER_HIT_BELOW = 17
MESSAGES = YAML.load_file("21_messages.yml")

def messages(message)
  MESSAGES[message]
end

def single_spacer
  puts ""
end

def double_spacer
  puts ""
  puts ""
end

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts ">>  #{msg}"
end

def press_enter
  gets
end 

def answer_yes(answer)
  %w(y ye yes yess).include?(answer)
end 

def answer_no(answer)
  %w(n no noo).include?(answer)
end 

def read_rules?
  loop do
    prompt messages("review_rules?")
    answer = gets.chomp.downcase
    if answer_yes(answer)
      display_rules
      break if press_enter
    elsif answer_no(answer)
      break
    else
      prompt messages("invalid_entry")
    end
  end
end

def display_rules
  clear_screen
  prompt messages("rules")
  single_spacer
  prompt messages("enter_to_start")
end

def initialize_deck
  CARD_VALUES.product(CARD_SUITS).shuffle
end

def deal_cards(deck)
  deck.pop(2)
end

def deal_hit(deck)
  deck.pop
end

def initial_card_reveal(player_hand, dealer_hand, player_total)
  single_spacer
  prompt "Dealer has #{dealer_hand[0].join(' of ')} and UNKNOWN CARD."
  double_spacer
  prompt "You have: #{player_hand[0].join(' of ')}" \
         " and #{player_hand[1].join(' of ')}."
  prompt "Your current hand total is #{player_total}."
  double_spacer
end

def total(hand)
  values = hand.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == "ACE"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "ACE" }.count.times do
    sum -= 10 if busted?(sum)
  end

  sum
end

def reveal_cards(hand)
  hand.map { |card| card.join(" of ") }
end

def busted?(hand_total)
  hand_total > TARGET_VALUE
end

def detect_winner(player_total, dealer_total)
  if player_total > TARGET_VALUE
    :player_busted
  elsif dealer_total > TARGET_VALUE
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :draw
  end
end

def display_result(player_total, dealer_total)
  result = detect_winner(player_total, dealer_total)

  case result
  when :player_busted
    prompt messages("player_bust")
  when :dealer_busted
    prompt messages("dealer_bust")
  when :player
    prompt messages("player_win")
  when :dealer
    prompt messages("dealer_win")
  when :draw
    prompt messages("draw")
  end
end

def max_wins_reached?(score)
  score[:player_score] == MAX_WINS || score[:dealer_score] == MAX_WINS
end

def next_round?
  answer = ""
  loop do
    prompt messages("next_round?")
    answer = gets.chomp.downcase
    if answer_yes(answer)
      return true
    elsif answer_no(answer)
      return false
    else
      prompt messages("invalid_entry")
    end
  end
end

def new_game?(score)
  if max_wins_reached?(score)
    prompt messages("new_game?")
    answer = gets.chomp

    if %w(y ye yes yess).include?(answer.downcase)
      true
    else
      false
    end
  end
end

def pause_two_secs
  sleep 2
end

def end_of_round_msg(dealer_hand, dealer_total, player_hand, player_total)
  clear_screen
  prompt "Dealer has #{reveal_cards(dealer_hand)}," \
         " totaling #{dealer_total}."
  single_spacer
  prompt "You have #{reveal_cards(player_hand)}," \
         " totaling #{player_total}."
  double_spacer
  display_result(player_total, dealer_total)
end

def increment_score(player_total, dealer_total, score)
  case detect_winner(player_total, dealer_total)
  when :player_busted
    score[:dealer_score] += 1
  when :dealer
    score[:dealer_score] += 1
  when :dealer_busted
    score[:player_score] += 1
  when :player
    score[:player_score] += 1
  when :draw
    score[:draws] += 1
  end
end

def congratulate_champ(score)
  if score[:player_score] == MAX_WINS
    prompt "You've reached #{MAX_WINS} wins. You are the champ!"
  elsif score[:dealer_score] == MAX_WINS
    prompt "Dealer reached #{MAX_WINS} wins. Dealer is the champ!"
  end
end

def display_score(score)
  prompt "Player Score: #{score[:player_score]}"
  prompt "Dealer Score: #{score[:dealer_score]}"
  prompt "Draws: #{score[:draws]}"
end

loop do
  clear_screen
  prompt "Welcome to #{TARGET_VALUE}!"
  prompt "First to win #{MAX_WINS} rounds is the champ!"
  read_rules?

  score = { player_score: 0, dealer_score: 0, draws: 0 }

  loop do
    clear_screen
    single_spacer
    display_score(score)
    deck = initialize_deck
    player_hand = []
    dealer_hand = []
    single_spacer

    prompt messages("dealing_cards")
    pause_two_secs

    clear_screen

    player_hand = deal_cards(deck)
    player_total = total(player_hand)

    dealer_hand = deal_cards(deck)
    dealer_total = total(dealer_hand)

    initial_card_reveal(player_hand, dealer_hand, player_total)

    loop do
      player_turn = nil

      loop do
        prompt messages("hit_or_stay?")
        player_turn = gets.chomp.downcase
        break if ['h', 'hit', 's', 'stay'].include?(player_turn)
        prompt messages("hit_stay_error")
      end

      if player_turn == 'h' || player_turn == 'hit'
        player_hand << deal_hit(deck)
        player_total = total(player_hand)
        clear_screen
        prompt messages("hit_choice")
        single_spacer
        prompt "Your cards are now #{reveal_cards(player_hand)}"
        prompt "Current hand total is #{player_total}"
      end

      break if player_turn == "s" || 
               player_turn == "stay" || 
               busted?(player_total)
    end

    if busted?(player_total)
      double_spacer
      end_of_round_msg(dealer_hand, dealer_total, player_hand, player_total)
      increment_score(player_total, dealer_total, score)
      double_spacer
      break if max_wins_reached?(score)
      display_score(score)
      single_spacer

      next_round? ? next : break
    else
      clear_screen
      prompt "You chose to stay at #{player_total}"
    end

    prompt messages("dealer_turn")
    pause_two_secs
    clear_screen
    prompt "Dealer's cards are #{reveal_cards(dealer_hand)}" \
           " totaling #{dealer_total}"
    pause_two_secs

    loop do
      break if dealer_total >= DEALER_HIT_BELOW

      pause_two_secs
      clear_screen
      prompt "Dealer hits..."
      dealer_hand << deal_hit(deck)
      dealer_total = total(dealer_hand)
      pause_two_secs
      clear_screen
      prompt "Dealer now has #{reveal_cards(dealer_hand)}," \
             " totaling #{dealer_total}."
    end

    if busted?(dealer_total)
      double_spacer
      end_of_round_msg(dealer_hand, dealer_total, player_hand, player_total)
      increment_score(player_total, dealer_total, score)
      break if max_wins_reached?(score)
      double_spacer
      display_score(score)
      single_spacer
      next_round? ? next : break
    else
      clear_screen
      prompt "Dealer stays at #{dealer_total}"
      pause_two_secs
    end

    clear_screen

    end_of_round_msg(dealer_hand, dealer_total, player_hand, player_total)
    increment_score(player_total, dealer_total, score)
    double_spacer
    break if max_wins_reached?(score)
    display_score(score)
    single_spacer
    next_round? ? next : break
  end

  congratulate_champ(score)
  double_spacer

  prompt messages("final_score")
  single_spacer
  display_score(score)
  double_spacer
  break unless new_game?(score)
end

prompt messages("thanks")