# Loan Calculator

require "yaml"
MESSAGES = YAML.load_file("lc_mess.yml")

# Method Definitions

def prompt(message)
  puts ">>> #{message}"
end

def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

# Gather input data from user
loop do 
  loan_amt = nil
  loop do 
    prompt(MESSAGES["request_loan_amount"])
    loan_amt = gets.chomp
    
    if number?(loan_amt)
      break
    else 
      prompt(MESSAGES["invalid"])
    end 
    loan_amt.to_f
  end 
  
  apr = nil
  loop do 
    prompt(MESSAGES["request_apr"])
    apr = gets.chomp
    
    if number?(apr)
      break
    else 
      prompt(MESSAGES["invalid"])
    end 
    apr.to_f
  end 
  
  
  duration_years = nil
  loop do 
    prompt(MESSAGES["request_duration"])
    duration_years = gets.chomp
    
    if number?(duration_years)
      break
    else 
      prompt(MESSAGES["invalid"])
    end
    duration_years.to_f
  end 
  
  
  # Input Conversions
  
  monthly_rate = apr.to_f / 100 / 12
  duration_months = duration_years.to_f * 12
  
  # Calculation
  
  monthly_payment = loan_amt * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))
  
  # Outputs to user
  
  prompt("For a loan of $#{loan_amt.to_i}")
  prompt("Repaid over a term of #{duration_years.to_i} years")
  prompt("With an annual interest rate of #{apr}%")
  prompt("Your monthly payment would be $#{monthly_payment.to_i.round(2)} per month")
  
  prompt(MESSAGES["again"])
  go_again = gets.chomp
  
  break unless %w(YES yes y Y ).include?(go_again)
  
end 