1. Create a method that takes 2 arguments, an array and a hash. 

The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. 

The hash will contain two keys, :title and :occupation, and the appropriate values. 

Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

P: 
  - input: array and hash
  - output: string 
  - rules: 
          - input array contains person's name as two or more elements 
          - input hash contains two key/value pairs..title, occupation
          - returned string should contain greeting including full name, title,    and occupation. 

E: 
```ruby 
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

=> Hello, John Q Doe! Nice to have a Master Plumber around.
```

D:
  - input: array, hash
  - output: string interpolated with array and hash values

A: 
  1. define method `greetings` takes two parameters, array and hash 
  2. initialize name variable.. set to array.join(' ')
  3. initialize title and occupation variable, set to hash values 
  4. output string with local variables interpolated appropriately 

C:
```ruby
def greetings(array, hash)
  name = array.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]
  
  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end 
```

2. A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 

For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.


P: 
  - input: integer
  - output: integer 
  - rules: 
          - if integer is a double number..return integer. 
          - if integer is not a double number, return (integer * 2)
          - double numbers contain even number of digits..
          - double numbers have same digits on left and right side 

E: 
```ruby 
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
```

D: 
  input: integer
  intermed: array?
  output: integer 
  
A:
  1. define method `twice` to take one parameter (integer)
  2. check number of digits in integer 
  3. if odd number of digits
       - multiply integer by 2, and return it. 
  4. if even number of digits
       - split number in half, so equal number of digits on both sides
       - compare left side to right side. 
       - if left == right, return integer 
       - if left != right, multiply integer by 2, and return product

C:
```ruby
def double_number?(integer)
  digit_array = integer.digits 
  comp1 = []
  comp2 = []
  target_index = digit_array.size / 2
  
  comp1 << digit_array[0..target_index - 1]
  comp2 << digit_array[target_index..-1]

  comp1 == comp2
end 


def twice(integer)
  digit_array = integer.digits

  if digit_array.size.odd?
    return integer * 2
  else 
    double_number?(integer) ? integer : integer * 2
  end 
end 
```
or

```ruby
def twice(num)
  num_array = num.digits
  num_middle = num_array.size / 2
  
  return num if (num_array[0...num_middle] == num_array[num_middle..-1])
  num * 2
end 
```

3. Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

P: 
  - input: integer.. pos, neg, zero
  - output: integer
  - rules: 
        - if input is positive, return negative  input
        - if input is negative or zero, return input as is

E: 
```ruby
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby
```

D: 
  
  
A: 
  1. define method `negative` to take one parameter (integer)
  2. check to see if the integer is > 0
      -if so, return -integer
  3. if integer is <= 0, return integer

C:
```ruby
def negative(integer)
  integer <= 0 ? integer : -integer
end 
```


4. Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

C: 
```ruby
def sequence(int)
  (1..int).to_a
end 
```
Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

```ruby
def sequence(int)
  int > 0 ? (1..int).to_a : (int..1).to_a
end
```


5. Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

C: 
```ruby
def uppercase?(string)
  string == string.upcase
end
```

6. Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

P: 
  -input: string 
  - output: array
  - rules: 
          - array contains each word from the string 
          - array elements contain appended space + word length 
          - words are defined as substrings of non-space characters
          - words are separated by one space 
          - words plus space plus length separate array elements 
E:
```ruby
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
```

D:
  -input: string 
  -intermed: array 
  -output: array 

A: 
  1. define method `word_lengths` to take one parameter (string)
  3. split string into array of words 
  4. for each word in array of words
      - check word length 
      - append " " + word_length to word
  6. output resulting new array 

C:
```ruby
def word_lengths(string)
  word_array = string.split
  
  word_array.map do |word|
    "#{word} #{word.size}"
  end 
end 
```

7. Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

P: 
  -input: string (first name (space) last name )
  -output: string (Last_name,(space) first_name)
  - rules: 
          - string passed as single argument
          - output formatted "lastname, firstname"

E: 
```ruby
swap_name('Joe Roberts') == 'Roberts, Joe'
```

D: 
  string
  array
  string 
  
A: 
  1. define method `swap_name` to take one parameter (string)
  2. split string into array.
  3. assign elements of array to local variables first_name, last_name
  4. output string with local vars interpolated in correct structure

C: 
```ruby
def swap_name(string)
  names = string.split
  first_name = names[0]
  last_name = names[1]
  
  "#{last_name}, #{first_name}"
end 
```
or

```ruby
def swap_name(name)
  name.split(' ').reverse.join(', ')
end 
```

8. Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. 

The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

P: 
  -input: two integers (count, first number of sequence)
  -output: array
  - rules: 
         - first argument is a count
         - second argument is first number of sequence 
         - return array
         - array contains same number of elements as count argument 
         - values of each element are multiples of second argument 
         - count argument will be >= 0 
         - if count is 0, return empty array 
         - second argument can be any integer value (pos or neg)

E: 
```ruby
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
```

D: 
  input: integer
  intermed: 
  output: array
  
A: 
  1. define method `sequence` to take two parameters (integers)
  2. initialize empty array for results
  3. starting with second argument..
  4. add starting integer to array
  5. next integer should be start integer * 2
  6. next integer should be start integer * 3
  7. continue incrementing value until result array size == first argument
  8. return result array
  9. 
  
C:
```ruby
def sequence(count, start_int)
  results = []
  multiplier = 1
  count.times do 
    results << start_int * multiplier
    multiplier += 1
  end 
  results
end 
```

9. Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

P: 
  -input: three positive integers
  - output: string (associate letter grade based on average)
  - rules: 
          - three arguments will be positive integers
          - return letter grade as string 
          - arguments will be between 0-100

E:
```ruby
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
```

D: 
  -input: 3 integers
  - intermed: hash
  - output: string 

A: 
  1. define method `get_grade` to take 3 parameters (integers)
  2. determine average of three integers 
  3. save average to local variable
  4. case statement for average to return letter grade
  5. return letter string

C:
```ruby
def get_grade(num1, num2, num3)
  avg = (num1 + num2 + num3) / 3
  if (90..100).include?(avg)
    'A'
  elsif (80..89).include?(avg)
    'B'
  elsif (70..79).include?(avg)
    'C'
  elsif (60..70).include?(avg)
    'D'
  else 
    'F'
  end
end
```
or

```ruby
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end
```


10.Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

P:
  -input: array subarrays [[item, count], [item, count], ...]
  -output: array..flat [item, item, item, other_item, other_item, ...]
  -rules: 
        - first element in sub_array is item, second is quantity
        - new array should be 1 dimensional
        - new array contains item count number of times
        

E:
```ruby
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
  ```

D: 
  input: array..nested
  output: flat array 
  
A: 
  # 1. define method `buy_fruit` to take one parameter (nested array)
  # 2. initialize empty result array
  # 3. convert input array to hash 
  # 4. iterate over hash 
  # 5. add hash keys value number of times
  # 6. return results array 
  

C:
```ruby
def buy_fruit(array)
 results = []
 hash = array.to_h
 
 hash.each do |item, count|
   count.times do 
     results << item 
   end 
 end 
 results
end 
```

11. Given the array...

```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
```

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. 

Your output should look something like this:

```ruby
["demo", "dome", "mode"]
["neon", "none"]
#(etc)
```

P: 
  input: array of strings
  output: sub arrays containing anagram words
  rules:
        - anagrams have exact same letters in different order
        - output should be arrays of anagram words
        - each array of anagrams should be printed on own line 
  Question: - should we inlcude duplicates..

E:
```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

["demo", "dome", "mode"]
["neon", "none"]
#(etc)
```

D:
  -arrays

A: 
  1. define method `list_anagrams` to take one parameter (array)
  2. starting with first word in array 
  3. check to see which other words contain same characters 
  4. if current word has anagrams  among other words in the array 
      - add array of word and anagram words to new array
  5. repeat for next word 
  6. output result array 

