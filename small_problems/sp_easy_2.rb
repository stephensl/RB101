# Small Problems Easy_2 


# 1. Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example Output: Teddy is 69 years old!

# puts "Let's find out how old Teddy is..."
# puts "Teddy is #{rand(20..200)} years old!"


# # Further Exploration

# def bear_stats
#   puts "What is your bear's name?"
#   name = gets.chomp
#   name = "Teddy" if name.empty?
#   age = rand(20..200)
  
#   puts "#{name} is #{age} years old!"
# end 

# bear_stats


#2. Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).


# puts "Enter the length of the room in meters"
# length_meters = gets.chomp

# puts "Enter the width of the room in meters"
# width_meters = gets.chomp

# square_meters = (length_meters.to_f * width_meters.to_f).round(2)
# square_feet = (square_meters * 10.7639).round(2)

# puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)." 


# Further Exploration

# puts "Enter the length of the room in feet."
# length = gets.chomp.to_f

# puts "Enter the width of the room in feet."
# width = gets.chomp.to_f

# square_feet = (length * width).round(2)
# square_inches = (square_feet * 144).round(2)
# square_centimeters = (square_inches * 6.4516).round(2)

# puts "The area of the room is #{square_feet} square feet, #{square_inches} square inches, and #{square_centimeters} square centimeters."


# 3. Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 

# The program must compute the tip and then display both the tip and the total amount of the bill.


# puts "Enter the total bill amount."
# bill_amt = gets.chomp.to_f

# puts "Enter tip percentage."
# tip_percentage = gets.chomp.to_f 

# tip_total = (bill_amt * (tip_percentage / 100 ))
# bill_with_tip = (bill_amt + tip_total)

# puts "The tip is $#{sprintf("%.2f", tip_total)}."
# puts "The bill, including tip is $#{sprintf("%.2f", bill_with_tip)}."



#4. Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example: 

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!



# current_year = Time.now.year

# puts "How old are you right now?" 
# current_age = gets.chomp.to_i 

# puts "At what age would you like to retire?"
# retirement_age = gets.chomp.to_i 


# remaining_work_years = (retirement_age - current_age)
# retirement_year = (current_year + remaining_work_years)


# puts "It's #{current_year}. You will retire in #{retirement_year}. You only have #{remaining_work_years} years to go!" 


#5. Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# puts "What is your name?"
# name = gets.chomp

#   if name.include?("!")
#     puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
#   else 
#     puts "Hello #{name}"
#   end 


#6. Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# number = 1

# while number <= 99
#   puts number if number.odd?
  
#   number += 1
# end 


# other options

# 1.upto(99) {|i| puts i if i.odd?}

# puts (1..99).to_a.select(&:odd?)


#7. Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# puts (1..99).to_a.select(&:even?)

# number = 1

# while number <= 99
#   puts number if number.even?
  
#   number += 1
# end 


#8. Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 
# and the entered integer.

# def valid_integer?(num)
#   num.to_i.to_s == num && num.to_i > 0 
# end 

# def valid_choice?(entry)
#   entry == "s" || entry == "p"
# end 

# integer = ''

# loop do 
#   puts "Please enter an integer greater than 0:"
#   integer = gets.chomp
  
#   break if valid_integer?(integer)
#   puts "Invalid entry..try again."
# end 

# choice = ''

# loop do 
#   puts "Enter 's' to compute the sum, or 'p' to compute the product."
#   choice = gets.chomp
  
#   break if valid_choice?(choice)
#   puts "Invalid entry..try again."
# end 

# case choice.downcase
#   when 's'
#     sum_total = (1..integer.to_i).reduce(:+)
#     puts "The sum of integers between 1 and #{integer.to_i} is #{sum_total}."
#   when 'p'
#     product_total = (1..integer.to_i).reduce(:*)
#     puts "The product of integers between 1 and #{integer.to_i} is #{product_total}."
# end 


# 9. 

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# Alice
# Bob

# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?

# BOB
# BOB 

# This is because we are calling a destructive method string#upcase! on name. Because save_name references the same string..'Bob'..save_name references the mutated string. 



# 10. What will the following code print, and why?

array1 = %w( Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []

array1.each { |value| array2 << value }                   # each element of array1 is being appended to array2

array1.each { |value| value.upcase! if value.start_with?('C', 'S') } 

puts array2 

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho 
Zeppo

In this case, we are appending each element of array1 to array2 in the first call to array#each. Thus, after iteration, array1 and array2 hold the same string elements. 

In the second call to array#each, we are mutating elements of array1. Will this, in turn, mutate elements shared in array2?

Yes, because both arrays contain the same string objects. If the object is modified in one array, it is reflected in the other. 

We could make a shallow copy of the elements in array1 to prevent problems with values being mutated in both places. 

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []

array1.each { |value| array2 << value.dup }           # elements in arrays now have different object_ids while reflecting same values. 
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

p array1
p array2

