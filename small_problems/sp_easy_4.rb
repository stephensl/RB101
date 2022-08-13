# Small Problems: Easy_4

# 1. Method that takes two strings as arguments, determines the longest of the two, then returns the result of concatenating the shorter string, longer string, and
    # shorter string once again. You can assume that the strings are of different lengths.

    # Examples:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"


# P: 
# Input: two strings of different lengths
# Output: single string concatenating shorter string + longer string + shorter string
# Rules: strings are of different lengths
#       return single string concatenating the two strings in this manner..short_long_short
#       accept two strings as arguments
# Questions: spaces and punctuation included? if strings are multiple words long. 

# E: 
# string1 = "wildcat" string2 = "bull"       => "bullwildcatbull"

# D: 
# strings as input and output. arrays to sort data

# A:
# - Define method accepting two parameters
# - Determine which of the two strings is longer
# - Concatenate the strings in order prescribed
# - Output new string

# C: 
# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else 
#     string1 + string2 + string1
#   end 
# end 


# 2. Write a method that takes a year as input and returns the century. Return value should be a string that begins with the century number, and ends
      # with st, nd, rd, or th as appropriate for that number. 
      
      # New centuries begin in years that end with 01. So the years 1901-2000 comprise the 20th century. 
      
SKIP

# 3. In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. 
# If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, 
# or false if it is not a leap year.


# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# P: 
#   Input: integer greater than zero 
#   Output: boolean- whether or not the year is a leap year. 
  
#   Rules: 
#     Explicit: - leap year occurs in every year that is divisible by 4, unless also divisible by 100. 
#               - If the year is evenly divisible by 100 (year % 100 == 0) not leap year unless year is evenly divisible by 400. (year % 400 == 0)
#     Implicit: - year will be a positive integer 
#               - year will not include any non-numeric characters. 
              
# E: 
#   leap_year(1700) == false... evenly divisble by 100, not evenly divisble by 400. 
  
# D: 
#   data structures? will use mathmatical operators.. possibly arrays to store data 
  
# A: 
#   - define method..leap_year.. that accepts one argument.. a positive integer (year)
#   - check to see if the year is divisible by 4
#     -if so, check to see if year is divisible by 100
#       - if not return true
#       - if so, check to see if year is evenly divisible by 400.
#         - if so, return true
#         - if not, return false. 
#       -if divisble by 4, and not 100, return true. 
#   - end 
  
#   C: 
  
#   def leap_year(year)
#     if year % 4 == 0 && year % 100 != 0 
#       return true
#     elsif year % 4 == 0 && year % 100 == 0 && year % 400 == 0
#       return true 
#     else 
#       return false
#     end 
#   end 
      
# or better solutions: 

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end


# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end



# 4. The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, 
#     leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine leap years both before and after 1752.


# def leap_year(year)
#   if year < 1752 && year % 4 == 0 
#     true
#   elsif (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
#     true
#   else 
#     false
#   end 
# end 
    
# or..

# def leap_year?(year)
#   if year < 1752 && year % 4 == 0
#     true
#   elsif year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end

# 5. Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. 
   
#   For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

#   You may assume that the number passed in is an integer greater than 1.
   

# P: 
#   Input: integer greater than one.
#   Output: integer.. sum of multiples of 3 or 5 between one and given integer
  
#   Rules: given integer will be greater than 1
#         returned integer will be sum of all multiples of 3 or 5
  
# E: 
#   given number 11
#   multiples of 3 || 5 == (3, 5, 6, 9) 
#   sum == 23
  
# D: 
#   integers
#   array for data storage/sum
  
# A: 
#   - define method that accepts one argument, positive integer
#   - input integer
#   - iterate through integers starting with 1 up to given integer
#   - if integer is multiple of 3 or 5 add to array
#   - sum elements of array
#   - output sum 
  
# C: 


# def multisum(integer)
#   multiples = []
  
#   (1..integer).select do |num|
#     multiples << num if num % 3 == 0 || num % 5 == 0
#   end 
#   multiples.sum 
# end 
 

# 6. Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# P: 
#   Input: array of numbers
#   Output: array of numbers 

# Rules: 
#   Explicit: - returned array has same number of elements as original
#             - returned array contains running total beginning with original integer element (index 0)
#             - returned array == [num[0], (num[0] + num[1]), ...
            
# E: 
#   -given arr [5, 8, 3] == [5, 13, 16] ... whats happening here...?
  
#     [5(original element), 13(5 + 8), 16 (13 + 3)]
    
# D: array

# A: 
#   - define method running_total
#   - input given array of numbers
#   - create total counter
#   - iterate through original array
#     - save first element, current_num as starting element
#     - increment total 
#       - push value to new array
#   - next iteration- total + current num
#     - push value to new array
#   - continue unti iterated through each element, incrementing total and adding to new array
#   - output new array
  

# C: 
  
#   def running_total(array)
#     total = 0 
#     result_array = []
    
#     array.each do |num|
#       total += num 
#       result_array << total 
#     end 
#     result_array
#   end 
  
#   or..
  
# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

