=begin 
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

input: string 
output: boolean
goal:return true if all parentheses in string are properly balanced.. occur only in matched pairs of '(' ')'. 

rules: 
  - to be properly balanced must contain same # of '(' as ')'
  - parentheses must start with '('
  - must have same number of open and closed parentheses

=end 


# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Examples:

# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# p: 
# input: three integers 
# output: symbol 
# goal: determine based on input integers, what kind of triangle it is, or none if not triangle

# rules: 
#   - equilateral- all sides equal
#   - isosceles- 2 sides equal 3rd different
#   - scalene three different 
  
#   - sum of lengths of two shortest sides must be greater than length of longest and 
#     - all sides must have lengths greater than 0. 
    
# e: 
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# d: 

# integers...          ... symbol (triangle)

# a: 

# - find invalid triangles.. 
#   - if one of integers is not greater than 0 
#   - if sum of two smaller integers not greater than other integer 
# - check if any integer is not greater than 0
#   - if so, return :invalid
# - check to see if all integers are same 
#   - if so, return :equilateral
# - check to see if two of three integers are same: 
#   - sort integers by size... check if first two are larger than 3rd. 
#     - if so, return :isosceles
# - sort integers by size 
#   - check if first two summed is greater than 3rd
#     - if so, return :scalene
    
# def triangle(int1, int2, int3)
#   arr = [int1, int2, int3].sort 
#   return :invalid if arr.any? { |num| num < 0 } || arr.first(2).sum <= arr[2]
  
#   case
#   when arr.all?(int1) then :equilateral 
#   when arr.any? { |num| arr.count(num) == 2 } then :isosceles
#   else :scalene 
#   end 
#   puts 'hi'
# end


# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

=begin
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Examples:
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid


def triangle(side1, side2, side3)
  arr = [side1, side2, side3].sort 
  
  return :invalid if arr.sum != 180 || arr.any? { |side| side <= 0 } 
  
  case 
  when arr.any? { |side| side == 90 } then :right
  when arr.all? { |side| side < 90 } then :acute
  else :obtuse 
  end 
  
end 

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

require 'date'

def friday_13th(year)
  start_date = Date.new(year)
  end_date = start_date + 364 
  
  (start_date..end_date).count { |date| date.friday? && date.mday == 13 } 
end 


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
=end

# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# p: 
# input: integer
# output: integer (next featured number)
# goal: return next number that is an odd multiple of 7 with unique digits 
# rules: 
#       - featured number must be multiple of 7 and 
#         - odd 
#         - unique digits 
#       - returned integer will be greater than input 
#       - if none, return error 

# e: 
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# d: 
# integer...     array           ...  featured number

# needs: 

# - multiple of 7 
# - odd
# - all unique digits 
# - next greater than input 

# a:
# - create range from input to .. infinity
# - iterate over range 
#   - return num if multiple of 7 and odd and uniq digits 
# - if none exist return error 
#   - if number higher than 9 999 999 999
#     - would have 11 digits.. one would have to repeat 
    
# c: 
# def featured(num)
#   max = 9_876_543_210
#   (num + 1..max).each do |num| 
#     if num % 7 == 0 && num.odd? && num.digits.uniq.size == num.digits.size 
#       return num 
#     end 
#   end 
  
#   'No next featured number'
# end 

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) #== 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# #featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


# bubble sort... 

# - starting with first element in the array 
#   - check if is smaller or larger than next element 
#     - if smaller, leave alone
#     - if larger, swap elements 
    
# require 'pry'
# def bubble_sort!(arr)
#   iterations = 1
  
#   loop do 
#     swapped = false 
#     1.upto(arr.size - iterations) do |idx|
#       if arr[idx - 1] > arr[idx]
#         arr[idx], arr[idx - 1] = arr[idx - 1], arr[idx]
#         swapped = true 
#       end 
#     end 
#     iterations += 1
#     return arr if swapped == false 
#   end 
# end 

# array = [5, 3]
# p bubble_sort!(array) == [3, 5]

# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array) == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# sum_square_difference(3) == 22
#   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150


# def sum_square_difference(int)
#   arr = (1..int).to_a 
#   sum_squared = (arr.sum)**2 
#   sum_of_squares = arr.inject { |sum, num| sum + num**2 } 
  
#   sum_squared - sum_of_squares
# end 

# p sum_square_difference(3) == 22
#   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150


def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)

