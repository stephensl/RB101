# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

LANGUAGE = "en"

def messages(message, lang="en")
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
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

prompt(messages("welcome", LANGUAGE))

name = nil
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages("valid_name"))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
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

  num2 = nil
  loop do
    prompt(messages("request_second_number"))
    num2 = gets.chomp

    if number?(num2)
      break
    else
      prompt("valid_number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide

  MSG

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages("valid_operator"))
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when "1"
             num1.to_f + num2.to_f
           when "2"
             num1.to_f - num2.to_f
           when "3"
             num1.to_f * num2.to_f
           when "4"
             num1.to_f / num2.to_f
           end

  prompt("The result is #{result}")

  prompt(messages("another_calculation"))
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(messages("thanks"))
