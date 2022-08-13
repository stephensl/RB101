# Small Problems RB 101-109 
# Easy 1

#1.  Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.


def repeat(word, number)
  number.times do
    puts word
  end 
end 


repeat("hello", 10)


# 2. Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.


def is_odd?(num)
  num % 2 != 0
end 

puts is_odd?(31)



# 3. Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.


def digitize(num)
  arr = num.to_s.split('')
  arr.map {|x| x.to_i}
end 

# or 

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end



# 4. Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2


def count_occurrences(array)
  occurances = {}
  
  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end 
  
  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end 
  

5. Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Test cases shoudl return true:

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


def reverse_sentence(string)
  string.split.reverse.join(" ")
end 


6. Write a method that takes one argument, a string containing one or more words, and returns the given string with
   words that contain five or more characters reversed. 
  
   Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.
 
Examples: 

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


def reverse_words(string)
  array = string.split.map! do |word|
    if word.length >= 5
      word.reverse!
    else
      word
    end 
  end 
  array.join(" ")
end 
    

7. Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. 
   
   The length of the string should match the given integer.
   
   Examples:
            puts stringy(6) == '101010'
            puts stringy(9) == '101010101'
            puts stringy(4) == '1010'
            puts stringy(7) == '1010101'
            
  ANSWER: 
  
  P: 
    Input: positive integer
    Output: string of alternating 1s and 0s 
    Rules: length of the string should match the given integer. 
           output should be in the form of a string 
           sequence of 1s and 0s should always start with 1 
           given input will be positive integer, not float or negative integer
           
  E: 
    positive integer: 5 
    => "10101"
    
  D: 
    possible data structure.. string, array
    
  A: 
    - create method definition that accepts one argument (positive integer)
    - initialize an empty array to collect data
    - set counter to 0 
    - populate array beginning with one, alternating with 0 until size of array == integer
    - break when size of array == integer 
    - increment counter to track sequence of 1s and 0s 
    - convert array of 1s and 0s to string. 
    - output string 
    
    
  C: 

  def stringy(integer)
    string_data = []
    counter = 0 
    
    loop do 
      if counter.even?
        string_data << "1"
      else 
        string_data << "0"
      end 
      counter += 1
      
      break if string_data.size == integer 
    end 
    string_data.join 
  end 
      
    
  8. Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
      The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.
      
Examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


ANSWER: 

def average(array)
  array.sum / array.size 
end 


9. Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Examples: 

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45


ANSWER: 

def sum(int)
  int.to_s.chars.map {|x| x.to_i}.sum 
end 



10. Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. 
    If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.
    
    Examples: 
    
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


ANSWER: 

def calculate_bonus(salary, boolean)
  if boolean == true
    salary / 2
  else 
    0 
  end 
end 

or 

def calculate_bonus(salary, boolean)
  boolean ? salary / 2 : 0
end 