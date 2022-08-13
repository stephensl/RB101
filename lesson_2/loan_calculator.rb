# Build loan calculator outputting \
# monthly interest rate, duration (months), and monthly payment.

# START
# Get desired loan amount
# Validate loan amount
# Set loan amount = principal
# Get APR %
# Validate APR
# Set APR = apr
# Get loan duration (months)
# Validate loan duration
# Set loan duration = term
# Calculate monthly interest rate
# Set monthly interest rate = monthly_rate
# Calculate monthly payment
# Set monthly payment = monthly_payment
# Output month_rate, term_months, monthly_payment
# Get another calculation?
# END

require "yaml"
MESSAGES = YAML.load_file("loan_calculator_messages.yml")
require "pry"

# Method Definitions

def messages(message)
  MESSAGES[message]
end

def prompt(string)
  puts "=> #{string}"
end

def retrieve_name(name)
  name = ""
  loop do
    name = gets.chomp
    break unless name.empty?
    prompt(messages("valid_name"))
  end
  name
end

def integer?(input)
  input.to_i.to_s == input #&& input.to_i > 0
end

def float?(input)
  input.to_f.to_s == input #&& input.to_f > 0
end

def number?(input)
  integer?(input) || float?(input)
end

def pos_nonzero?(input)
  input.to_f > 0
end 

def get_principal
  principal = nil
  prompt(messages("loan_amt"))
  
  loop do
    principal = gets.chomp
    if number?(principal) && pos_nonzero?(principal)
      break
    else
      prompt(messages("invalid_loan"))
    end
  end
  principal.to_f
end

def get_duration
  term = nil
  prompt(messages("get_duration"))

  loop do
    term = gets.chomp
    if number?(term)
      break
    else
      prompt(messages("invalid_duration"))
    end
  end
  term.to_f
end

def get_apr
  apr = nil
  prompt(messages("get_apr"))

  loop do
    apr = gets.chomp
    if number?(apr)
      break
    else
      prompt(messages("invalid_apr"))
    end
  end
  apr.to_f
end

def convert_apr(apr)
  apr / 100 / 12
end

def calculate_payment(principal, monthly_rate, term)
  monthly_payment = principal * (monthly_rate / # continued next line
  (1 - (1 + monthly_rate)**(-term)))
  monthly_payment.round(2)
end

def output_result(principal, apr, term, monthly_payment)
  prompt "You are borrowing $#{format('%.2f', principal)}"
  prompt "Your annual interest rate is #{apr}"
  prompt "You have #{term} months to repay this loan"
  prompt "Your monthly payment will be $#{format('%.2f', monthly_payment)}"
end

def go_again
  answer = ""
  go_again = nil
  loop do
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes"
      go_again = true
      break
    elsif answer == "n" || answer == "no"
      go_again = false
      break
    else
      prompt(messages("again_error"))
    end
  end
  go_again
end

# Main Program

system("clear")

prompt(messages("welcome"))
sleep(1)

prompt(messages("first"))
sleep(2)
system("clear")

prompt(messages("get_name"))

name = retrieve_name(name)
system("clear")

prompt("Hi, #{name}!")

loop do # Main Loop
  principal = get_principal

  term = get_duration

  apr = get_apr
  system("clear")

  monthly_rate = convert_apr(apr)

  monthly_payment = calculate_payment(principal, monthly_rate, term)

  prompt(messages("calculating"))
  sleep(2)
  system("clear")

  output_result(principal, apr, term, monthly_payment)

  puts "\n\n"

  prompt(messages("another_calculation"))

  break unless go_again
  system("clear")
end

system("clear")
prompt(messages("thanks"))
