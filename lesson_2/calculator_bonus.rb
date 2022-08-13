# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require "yaml"
require "pry"
MESSAGES = YAML.load_file("calculator_messages.yml")
LANGUAGE = "en"

# Method Definitions

def messages(message, lang="en")
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def retrieve_name(name)
  loop do
    name = gets.chomp

    break unless name.empty?
    prompt(messages("valid_name"))
  end
  name
end

def get_first_number
  num1 = nil
  loop do
    prompt(messages("request_first_number"))
    num1 = gets.chomp

    if number?(num1)
      break
    else
      prompt(messages("valid_number"))
    end
  end
  num1
end

def get_second_number
  num2 = nil
  loop do
    prompt(messages("request_second_number"))
    num2 = gets.chomp

    if number?(num2)
      break
    else
      prompt(messages("valid_number"))
    end
  end
  num2
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

def operator_choice
  operator = nil
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages("valid_operator"))
    end
  end
  operator
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "multiplying"
  when "4"
    "dividing"
  end
end

def calculation(operator, num1, num2)
  result = case operator
           when "1"
             num1.to_f + num2.to_f
           when "2"
             num1.to_f - num2.to_f
           when "3"
             num1.to_f * num2.to_f
           when "4"
             if num1.to_f == 0 || num2.to_f == 0
               "undefined as a result of zero division"
             else
               num1.to_f / num2.to_f
             end
           end
  result
end

def calculate_again?
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

# Begin program

prompt(messages("welcome", lang))

name = retrieve_name(name)

system("clear")

prompt("Hi #{name}!")

loop do # main loop
  num1 = get_first_number
  num2 = get_second_number

  system("clear")

  prompt(messages("operator_prompt"))
  operator = operator_choice

  system("clear")

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = calculation(operator, num1, num2)

  prompt("The result is #{result}")

  prompt(messages("another_calculation"))

  break unless calculate_again?
end

system("clear")

prompt(messages("thanks"))
