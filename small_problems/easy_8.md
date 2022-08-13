1. Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

P: 
  input: array of numbers 
  output: integer 
          - total sum of sums of each leading subsequence for the array 
  rules: 
        - subsequence is.. [1, 2, 3]... (1) + (1 + 2) + (1 + 2 + 3) == 10 
        - array contains at least one number 

E: 
```ruby 
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
```

D: input: array 
   output: integer 

A: 
  1. define method `sum_of_sums` to take one parameter, array of numbers 
  2. initialize local variable total starting at 0 
  3. initialize an empty array `calc` to be used for calculations
  4. starting with index 0 of input array.. 
  5. add num to calc. 
  6. sum calc, increment total with sum 
  7. add next num to calc
  8. sum calc, increment total with sum
  9. repeat until calc.size == input_array.size and total has been incremented. 
  10. return total 

C: 
```ruby
def sum_of_sums(array)
  total = 0 
  calc_arr = []
  
  array.each do |num| 
    calc_arr << num 
    total += calc_arr.sum 
  end 
  p total 
end 
```

2. Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.



P:
  -input: strings
  -output: string including input strings 
  -rules: 
        - prompt user to enter total of 4 strings 
        - output string contains story including input strings interpolated 

E:
```ruby
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
```

D:
strings

A: 
  1. define method mad_libs taking zero parameters 
  2. prompt user to enter noun, verb, adjective, adverb
  3. save each input in local variable
  4. output string story, containing local vars interpolated in string. 

C: 
```ruby 
def prompt(msg)
  puts ">> #{msg}"
end 

prompt("Enter a noun:")
noun = gets.chomp

prompt("Enter a verb:")
verb = gets.chomp

prompt("Enter an adjective:")
adjective = gets.chomp

prompt("Enter an adverb:")
adverb = gets.chomp

puts "I really like to #{verb} with my #{noun}. We #{verb} #{adverb} through the #{adjective} park."
```

3. Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

P: 
  input: string
  output: array 
  rules:
        - output is array of all substrings 
        - substrings start with first character of input string 
        - substring array will be ordered from shortest to longest
        - empty string return empty array 


E:
```ruby
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
```

D: input: string 
   output: array 

A:
  1. define method `leading_substrings` that takes one parameter, (string)
  2. initialize sub_string_length to track length of substrings 
  3. initialize substring_array to hold substrings 
  4. break string into characters 
  5. starting at index 0 of character array..
     - iterate over remaining characters 
     - push substrings equal to substring length 
     - increment substring length 
     - break when substring length == string length (after longest substring added to array)
C:
```ruby
def leading_substrings(string)
  substring_arr = []
  start_index = 0 
  substr_length = 0
  
  while substr_length < string.length
      substring_arr << string[start_index..substr_length]
      substr_length += 1
  end 
  substring_arr
end 
```
or

```ruby
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end 
```

4. Write a method that returns a list of all substrings of a string. 

The returned list should be ordered by where in the string the substring begins. 

This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. 

Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:


P: 
  -input: string
  -output: array
  -rules: 
        - array ordered by where in the string substring begins
          - all substrings that start at index 0 should come first
        - substrings at given position should be orderered shortest to        longest 
        - use leading_substrings method from previous exercise
  - questions: 
             - how should spaces be handled
        


E:
```ruby
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
```

D: 
  input: string
  output: array of substrings
  
A: 

# 1. define method substrings to take one parameter (string)
# 2. set starting index from which to create substrings 
# 3. select substring from index 0 to end of string..
#   pass to leading_substrings method 
#   push result to subs_array
# 4. increment starting index by 1, pass substring from 1..-1 to leading_substrings method
#   push result to subs_array.
# 5. repeat step 4 until starting index == string length 
# 6. return subs_array 

C: 
```ruby 
def leading_substrings(string)
  results = []
  
  0.upto(string.length - 1) do |index|   # 0.upto(7)
   results <<  string[0..index]
 end 
 results
end 

def substrings(string)
  subs_array = []
  (0...string.size).each do |start|
    current_string = string[start..-1]
    subs_array.concat(leading_substrings(current_string))
  end 
  subs_array
end 
```

5. Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. 

The return value should be arranged in the same sequence as the substrings appear in the string. 

Duplicate palindromes should be included multiple times.


You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.


P: 
  - input: string
  - output: array of substrings that are palindromic
  - rules: 
          - substrings must be at least 2 characters long 
          -  substrings ordered in same sequence as appear in string
          -  include duplicates ordered correctly
          -  use substrings method from previous exercise
          -  consider all characters, including spaces and case 
          -  if no palindromes, return empty array

E:
```ruby
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
```

D: input: string
   output: array 


A:
  1. define method `palindromes` that takes one parameter (string)
  2. break string into array of substrings 
  3. check each substring in array to see if is palindrome
  4. push palindrome substrings to new array 
  5. return new array 


C:
```ruby
def leading_substrings(string)
  results = []
  
  0.upto(string.length - 1) do |index|   # 0.upto(7)
   results <<  string[0..index]
 end 
 results
end 

def substrings(string)
  subs_array = []
  (0...string.size).each do |start|
    current_string = string[start..-1]
    subs_array.concat(leading_substrings(current_string))
  end 
  subs_array
end 
  
  
def is_palindrome?(string)
  string == string.reverse
end 
  
  
def palindromes(str)
  all_substrings = substrings(str)
  
  palindrome_substrings = all_substrings.select do |sub|
    is_palindrome?(sub) && sub.size > 1
  end 
  
  palindrome_substrings 
end 
```

6. Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 

Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

P:
  -input: two integers
  -output: string 
  - rules: 
        - first integer is starting number 
        - second integer ending number 
        - print all numbers between two numbers:
          - if num divisible by 3 print "Fizz"
          - if num divisible by 5 print "Buzz"
          - if num divisible by 3 and 5 print "FizzBuzz"
          - if num not divisible by 3 or 5 priny num 
  - questions.. 
               - if first num bigger than second num 
               - negative nums 
               - for my solution, will assume positive integer arguments

E: 
```ruby
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
```
D: 
  -input: integers
  -intermed: array
  -output: string

A: 
  1. define method `fizzbuzz` to take two parameters (integers)
  2. initialize empty results array
  3. create array of all integers between start/end integers 
  4. starting with first number in array...
     -check if divisible by 3 & 5
        - if so, add string, "FizzBuzz" to result array
        - if not 
          - check if divisible by 3
          -   if so, add string "Fizz" to result array 
      -   if not 
      -     Check if num divisible by 5..
      -       if so, add string "Buzz" to result array 
      -       if not, add num to result array
    -join array by (", ")
    - return result array

C:
```ruby
def fizzbuzz(int_1, int_2)
  number_array = (int_1..int_2).to_a
  result_array = []
  
  number_array.each do |num|
    if num % 3 == 0 && num % 5 == 0
      result_array << "FizzBuzz"
    elsif num % 3 == 0 
      result_array << "Fizz"
    elsif num % 5 == 0
      result_array << "Buzz"
    else 
      result_array << num 
    end 
  end 
 p result_array.join(', ')
end 
```

7. Write a method that takes a string, and returns a new string in which every character is doubled.

P:
  -input: string 
  -ouput: new string (each character doubled)
  -rules: 
        - maintain case..doubled chars should be same case 
        - non alphabetic chars should be doubled too. including spaces
        - empty string return empty string 


E:
```ruby
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
```

D:
- input: string
- intermed: array
- output: new string

A:
  1. define method `repeater` to take one parameter (string)
  2. split string into characters 
  3. iterate through each character
  4. double each character
  5. add doubled character to new array 
  6. join new array back to a string 
  7. output new string 


C: 
```ruby
def repeater(string)
  char_array = string.chars
  
  doubled = char_array.map do |char|
    char * 2
  end 
  
  doubled.join
end 
```

or
```ruby

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end 
  result 
end 
```

8. Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

P: 
  input: string 
  output: new string with consonants doubled
  rules: 
        - double each letter that is a consonant
        - leave alone all vowels and non-consonant characters
        - maintain original case
        - empty string return empty string 

E:
```ruby
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
```

D:
  input: string
  intermed: array
  output: new string
  
  
A:
  1. create consonant array of only consonant letters 
  2. define method `double_consonants` to take one parameter (string)
  3. initialize new string = ''
  3. iterate over each character in string
  4. check to see if char is consonant, if so, double it
  5. push doubled letter to new string 
  5. if current char is non-consonant, do not double. 
  6. push single char to new string 
  7. return new string 

C:
```ruby

alphabet_arr = ('a'..'z').to_a
alphabet_string = alphabet_arr.join
CONSONANT_STRING = alphabet_string.delete('aeiou')

def double_consonants(string)
  result = ''
  string.each_char do |char|
    if CONSONANT_STRING.include?(char.downcase)
      result << char << char 
    else 
      result << char 
    end 
  end 
  result 
end 
```
or

```ruby
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end
```

9. Write a method that takes a positive integer as an argument and returns that number with its digits reversed. 

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

P: 
  input: positive integer
  output: integer with digits reversed
  rules:
        - input integer is positive 
        - output number is integer with digits in reverse order 
        - do not worry about leading zeros in arguments 
        
        
E: 
```ruby
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
```


D: 
- input: integer
- intermed: string
- output: integer 


A: 
  1. define method `reversed_number` to take one parameter (integer)
  2. convert integer to string 
  3. reverse digits in string 
  4. convert back to integer]
  5. output integer
  



C:
```ruby
def reversed_number(integer)
  reversed_string = integer.to_s.reverse
  reversed_integer = reversed_string.to_i
  reversed_integer
end 
```


10. Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.

If the argument has an odd length, you should return exactly one character. 

If the argument has an even length, you should return exactly two characters.


P: 
  - input: string (non-empty)
  - output: string (middle char/chars in argument)
  - rules: 
          - string input will be non-empty
          - if input string has odd chars, return middle char
          - if input string has even chars, return middle 2 chars
          - if input is one or two chars, return all chars 
          - include spaces and non-alphabetic chars in determining middle

E:
```ruby
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
```

D:
  input: string 
  intermed: 
  output: string 

A: 
  1. define method `center_of` to take one parameter, (string)
  2. determine size of string 
  3. if string size is odd.. 
     - return char at index of string size / 2 
  4. if string size is even..
     - return char at index of string size / 2 and string size / 2 - 1
  5. end



C:
```ruby
def center_of(string)
  result = ''
  if string.size.odd?
    result << string[string.size / 2]
  else
    result << string[string.size / 2 - 1] << string[string.size / 2] 
  end 
  p result 
end 
```
or

```ruby
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else 
    string[center_index - 1, 2]
  end 
end 

