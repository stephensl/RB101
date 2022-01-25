# # Small Poblems..Easy 3

# # 1. Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# P: 
#   Inputs:
#     - six numbers provided by user. 
#   Outputs: 
#     - string, specifying whether or not the sixth number provided appears among the first five numbers. 
#   Explicit Rules:
#     - Ask for six numbers from user.. user provides six numbers
#     - Output message describing whether the sixth number appears among the previous five numbers provided. 
# Questions: 
#     - what do we mean by number? 
#       - integers, floats, negative-numbers?
#       - can numbers be zero?
#       - how are inputs formatted..commas, decimals rounded?
#   Implicit Rules: (based on examples provided)
#     - User inputs are positive integers. 
#     - User can provide the same number multiple times. 
#     - Output string is a message that includes an array of the first five numbers provided. 
#     - Output string states the sixth number provided, and whether or not it appears in an array of the previous five provided.
  
# E: 
#   >> Enter first number:
#   10
#   >> Enter second number:
#   3
#   >> Enter third number: 
#   1
#   >> Enter fourth number: 
#   10000
#   >> Enter fifth number: 
#   80
#   >> Enter sixth number:
#   11
  
#   >> The number 11 does not appear in [10, 3, 1, 10000, 80]. 
  
#   D: 
#     - Data structures utilized in this program include arrays to store data, and strings to output messages/prompts. 
    
#   A: 
#     - Ask user to provide first number. 
#       - Store number. 
#     - ASk user to provide next five numbers.
#       - Store numbers
#     - Check to see if the sixth number provided by the user is present among the previous five.
#       - If so, output message notifying the user + provide the sixth number and array of previous five. 
#       - If not, output message notifying the user + provide the sixth number and array of the previous five. 
      
#   C: 
  
# def prompt(message)
#   puts ">> #{message}"
# end 

# numbers_array = []


# prompt("Enter the 1st number:")
# numbers_array << gets.chomp.to_i 

# prompt("Enter the 2nd number:")
# numbers_array << gets.chomp.to_i 

# prompt("Enter the 3rd number:")
# numbers_array << gets.chomp.to_i 

# prompt("Enter the 4th number:")
# numbers_array << gets.chomp.to_i  

# prompt("Enter the 5th number:")
# numbers_array << gets.chomp.to_i  

# prompt("Enter the last number:")
# last_number = gets.chomp.to_i  

# if numbers_array.include?(last_number)
#   prompt("The number #{last_number} appears in #{numbers_array}.")
# else
#   prompt("The number #{last_number} does not appear in #{numbers_array}.")
# end 


# 2. Write a program that prompts the user for two positive integers, then prints the results of the following operations on those two numbers: 
# Addition, subtraction, product, quotient, remainder and power. Input validation not req'd. 

# puts ">> Enter the first number:"
# first_num = gets.chomp.to_i

# puts ">> Enter the second number:"
# second_num = gets.chomp.to_i

# puts (
#       "#{first_num} + #{second_num} = #{first_num + second_num}
#       #{first_num} - #{second_num} = #{first_num - second_num}
#       #{first_num} * #{second_num} = #{first_num * second_num}
#       #{first_num} / #{second_num} = #{first_num / second_num}
#       #{first_num} % #{second_num} = #{first_num % second_num}
#       #{first_num} ** #{second_num} = #{first_num ** second_num}"
#       )

# Alt solution

# operations_array = %i(+ - * / % **)

# puts "=> Enter the first number:"
# first = gets.chomp.to_f
# puts "=> Enter the second number:"
# second = gets.chomp.to_f

# operations_array.each do |operation|
#   result =  [first, second].inject(operation)
#   puts "#{first} #{operation} #{second} = #{result}"
# end
  
  
  
# 3. Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# puts "Enter a word or multiple words."
# input = gets.chomp

# chars_count = input.split.join.chars.count

# puts "There are #{chars_count} characters in '#{input}'."


# 4. Create a method that takes two arguments, multiplies them together, and returns the result.

# def multiply(num1, num2)
#   num1 * num2
# end 



# # 5. Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# # Example: 
# # square(5) == 25
# # square(-8) == 64


# def square(num)
#   multiply(num, num)
# end 

# p square(10)


# # 6. In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. 
# # Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.


# def xor?(first, second)
#   if first == true && second == false
#     true
#   elsif first == false && second == true
#     true
#   else 
#     false
#   end 
# end 
      

# # 7. Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 
# #    The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(array)
#   odds = []
#   array.each_with_index do |el, idx|
#     odds << el if idx.even?
#   end
#   odds
# end 

# def even_elements(array)
#   evens = []
#   array.each_with_index do |el, idx|
#     evens << el if idx.odd?
#   end 
#   evens
# end 

# def oddities_alt(array)
#   array.each_with_object([]) do |el, arr|
#     arr << el if array.index(el).even?
#   end 
# end 

# def oddities_alt2(array)
#   array.select {|el| array.index(el).even?}
# end 


# # 8. Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
# # For this exercise, case matters as does punctuation and spaces.

# def palindrome?(string)
#   string == string.reverse
# end 


# # 9. Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# # This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 

# def palindrome?(input)
#   input = input.downcase.delete('^a-z0-9') 
#   input == input.reverse
# end 


# #10. Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

# def palindromic_number?(num)
#   num.to_s == num.to_s.reverse
# end 
