1. Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

P: 
  - input: two array
    - contain same number of elements 
  - output: single new array
    - contains all elements from both arrays, alternating 
  -rules: 
        - input arrays are non-empty
        - same number of elements in each array 
        - arr1 = [1, 2, 3], arr2 = [3, [4, 5, 6], 7]
        - assume that sub-arrays are single element. 

E: 
```ruby
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
interleave([4, 5, 6], [7, [8, 9, 10], 11]) == [4, 7, 5, [8, 9, 10], 6, 11]
inteleave([], []) == []
```

D: arrays 

A: 
  1. define method to take two parameters (arrays of equal size)
  2. initialize new empty array to contain result 
  3. begin with first array..pass first element into new array 
  4. select second array.. pass first elelemt to new array 
  5. repeat steps 3-4 until new_array contains all elements from arguments
  6. return the new array 


 notes: 
  - iterating over arrays based on index 
  - first array at index 0..pass to new array 
  - second array at index 0, pass to new array 
  - first array at index 1, pass to new
  - second array at index 1, pass to new 
  - end loop when new_array.size == arr1.size * 2
  - 
C: 
```ruby
def interleave(arr_1, arr_2)
  results = []
  index = 0 
  
  until results.size == (arr_1.size) * 2
    results << arr_1[index]
    results << arr_2[index]
    index += 1
  end 
  results
end 
```
or 
```ruby
def interleave(arr_1, arr_2)
  result = []
  arr_1.each_with_index do |element|
    result << element << arr_2[index]
  end 
  result
end 
```
Take a few minutes to read about Array#zip. #zip doesn't do the same thing as interleave, but it is very close, and more flexible. In fact, interleave can be implemented in terms of zip and one other method from the Array class. See if you can rewrite interleave to use zip.

```ruby
def interleave(arr_1, arr_2)
 result = (arr_1.zip(arr_2)).flatten 
 p result
end 
```

2. Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.


P: 
  - input: string
  - output: hash
    - contains 3 key/value pairs: lowercase, uppercase, neither 
  - rules: 
         - spaces and non-alphabetic chars considered neither 
         - empty string- all values in hash == 0

E: 
```ruby 
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
```

D: string and  hash 

A: 
  1. define method to take one parameter (string)
  2. initialize hash with 3 key value pairs 
  3. check each character in the string to see if it is:
     - uppercase
     - lowercase
     - neither
  4. increment respective hash value 
  5. end iteration when reach end of the string 
  6. return hash 

C:
```ruby
ALPHACHARS = ('a'..'z').to_a + ('A'..'Z').to_a
  
  def letter_case_count(str)
    hash = { lowercase: 0, uppercase: 0, neither: 0 }
    
    str.each_char do |char| 
      if !ALPHACHARS.include?(char)
        hash[:neither] += 1
      elsif char.upcase == char 
        hash[:uppercase] += 1
      elsif char.downcase == char 
        hash[:lowercase] += 1
      end 
    end 
    hash 
  end 
```


3.Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank character

C: 
```ruby
def word_cap(str)
  word_array = str.split.map do |word|
    word.capitalize
  end 
  word_array.join(" ")
end
```

Further Exploration:

Ruby conveniently provides the `String#capitalize` method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.
```ruby
def word_cap(str)
  result = []
  
  str.split.each do |word| # i can now access each word in: ['word', 'word', ..]
    result << word[0].upcase + word[1..-1].downcase
 end 
 result.join(' ')
end 
```

4. Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.


P: 
  - input: string 
  - output: new_string, with every character transformed to it's opposite case 
  - rules: all other characters (non-alphabetic) should stay the same. 
           - if letter is lowercase, transform to uppercase
           - if uppercase, transform to lower case

E: 
```ruby
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
```

D: 
array 

A: 
  - define method `swapcase` that takes one parameter (string)
  - initialize results array to pass characters to
  - break string into characters
  - check each character to see if it is alphabetic..if not, leave as is. 
  - if character is alphabetic, check if it is uppercase or lowercase
    if uppercase, swap to lowercase and add to results array 
    if lowercase, swap to uppercase and add to results array
  - stop iteration at end of array
  - join results array chars back to string
  - output string 

C: 
```ruby

def is_alphabetic?(str)
  alpha_arr = ('a'..'z').to_a + ('A'..'Z').to_a
  alpha_arr.include?(str)
end 

def find_case(char)
  char.upcase == char ? :uppercase : :lowercase
end 

def swapcase(string)
  result = []
  string.each_char do |char|
    if is_alphabetic?(char) && find_case(char) == :uppercase 
      result << char.downcase
    elsif is_alphabetic?(char) && find_case(char) == :lowercase
      result << char.upcase
    else 
      result << char 
    end 
  end 
  result.join
end
```
with regex
```ruby
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end
```

5. Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

P: 
  - input: string 
  - output: new string

  rules:    
            - every other letter capitalized, other characters lowercase. 
            - non-alphabetic characters left alone, but count in capitalization sequence
            - spaces count as characters in sequence
            - first character should be capitalized... cap, low, cap, low, ..
            - empty string return empty string 

E: 
```ruby
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
staggered_case('') == ''
staggered_case('!!77 abc 789) == '!!77 aBc 789' 
```

D: array 

A: 
  - define method `staggered_case` which takes one parameter..string 
  - initialize empty result array
  - initialize index to 0
  - split string into characters 
  - check each character, starting at index 0 
  - check whether character is alphabetic
    - if not, add to result array
      - increment index 
    - if so, check index 
      - if even? capitalize char and add to result
      - if odd? lowercase char and add to result 
    - increment index 
  - join results array to string 
  - return results 

C: 
```ruby
def is_alphabetic?(str)
  alpha_arr = ('a'..'z').to_a + ('A'..'Z').to_a
  alpha_arr.include?(str)
end 

def staggered_case(str)
  result = []
  index = 0 
  
  str.each_char do |char|
    if is_alphabetic?(char) && index.even? 
      result << char.upcase
    elsif is_alphabetic?(char) && index.odd?
      result << char.downcase 
    else 
      result << char 
    end 
    index += 1
  end 
  p result.join()
end 
```

6. Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.


The way my prvious method was defined, all I needed to do was only increment index on alphabetic chars.

```ruby
def is_alphabetic?(str)
  alpha_arr = ('a'..'z').to_a + ('A'..'Z').to_a
  alpha_arr.include?(str)
end 

def staggered_case(str)
  result = []
  index = 0 
  
  str.each_char do |char|
    if is_alphabetic?(char) && index.even? 
      result << char.upcase
      index += 1
    elsif is_alphabetic?(char) && index.odd?
      result << char.downcase 
      index += 1
    else 
      result << char 
    end 
  end 
  p result.join()
end 
```

7. Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.


P: 
  - input: array of integers 
  - output: float, rounded to 3 decimal places 
  - rules: 
          - assume array is non-empty 
          - multiply all integers in array together
          - divide by number of integers in array 
          - result should be a float.. rounded to 3 decimal places

E: 
```ruby
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
```


D: arrays 

A: 
  1. define method `show_multiplicative_average` which takes one parameter, an array of integers 
  2. multiply all integers in array together, save product 
  3. divide product by number of integers in array 
  4. format result to 3 decimal places 
  5. output result 

C: 
```ruby
def show_multiplicative_average(array)
  product = array.inject(:*)
  result = product.to_f / array.size 
  "The result is #{sprintf('%.3f', result)}"
end 
```

8. Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.


P:
  - input: two arrays, containing list of numbers
  - output: new array
            - contains product of each pair of numbers from arguments that have same index 
  - rules: 
          - assume that arguments contain the same number of elements 
          - new array should contain product of elements at particular index in each array. 

E: 
```ruby
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
```

D: arrays

A: 
  1. define method to take two parameters- two arrays 
  2. combine arrays to create sub-arrays based on shared index 
  3. multiply elements of each sub-array
  4. push products to new array 
  5. return new array 


C: 
```ruby
def multiply_list(arr_1, arr_2)
  zipped = arr_1.zip(arr_2)
  zipped.map do |sub_array|
    sub_array.inject(:*)
  end 
end 
```


9. Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

P: 
  - input: two arrays- each containing numbers 
  - output: new array
  - rules: 
         - new array contains product of every pair of numbers that can be formed between 2 arrays
         - results should be sorted by increasing value 
         - assume that neither array argument is empty 
  

E: 
```ruby
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
```

D: 
  - array

A: 
  1. define method that takes two parameters (arrays)
  2. initialize empty result array 
  3. starting with the first number in `array_1`, multiply it by each number in `array_2`
     - push product to result array 
  4. repeat for each element of array_1
  5. sort results from lowest to highest value 
  6. return sorted result array 


C: 
```ruby
def multiply_all_pairs(array_1, array_2)
  result = []

  array_1.each do |num|
    array_2.each do |elem| 
      result << num * elem 
    end 
  end 
  result.sort 
end 
```


10. Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

E: 
```ruby
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
```

D: array 

A: 


C: 
```ruby
def penultimate(str)
  str.split[-2]
end 
```

Suppose we need a method that retrieves the middle word of a phrase/sentence. 

What edge cases need to be considered? 
  - if phrase or sentence has even number of words, which is considered middle?
  - if only one word is in string 
  - empty strings
  - non-alphabetic characters..are we only interested in words?

How would you handle those edge cases without ignoring them? 
  - if even num words output that there is not a middle word.. or output the two middle words together?
  - if only one word..output middle character, or middle two characters
  - empty string return empty string 
  - treat any series of characters as word. words delimited by spaces 

Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

P: 
  - input: string 
  - output: string 
  - rules:
         - output should be middle word or two words of string
         - if only one word in string, return middle character or middle two characters 
         - if empty string return empty string 
         - consider a word any series of characters, delimited by spaces 
         - only count words, not spaces as characters when determining middle word. 
E: 
```ruby
middle_string('the hills are alive with the sound of music') == 'with'
middle_string('welcome to the family') == 'to the' 
middle_string('dinosaur') == 'os'
middle_string('') == ''
middle_string('Bob        is       cool') == 'is' 
```

D: input: string 
   intermed: array
   output: string 
   
A: 
  1. define method `middle_string` to accept one parameter(string)
  2. break string into array of words 
  3. check to see how many words are in the array 
  4. determine index range of words in array 
  4. if there are even number of words in array, return two middle words based on index
  5. if there are odd number of words in array, return middle word based on index 
  6. if there is only one word in array
     - determine how many characters are in word 
     - determine index range
        - if num of chars is odd return middle char based on index
        - if num of chars is even return middle two chars based on index 

C:
```ruby
def middle_char(word)
  middle_char = []
  char_array = word.chars 
  
  char_array.each_with_index do |char, index|
    if word.size == 1
      middle_char << char 
    elsif word.size.odd? && index == word.size / 2
      middle_char << char
    elsif word.size.even? && (index == word.size / 2 || index == word.size / 2 - 1)
      middle_char << char
    end 
  end 
  middle_char
end 

def middle_string(str)
  word_array = str.split 
  num_of_words = word_array.size
  middle_word = []
  
  word_array.each_with_index do |word, index|
    if word_array.size == 1 
      middle_word << middle_char(word)
    elsif num_of_words.odd? && index == num_of_words / 2
      middle_word << word
    elsif num_of_words.even? && (index == num_of_words / 2 || index == num_of_words / 2 - 1) 
      middle_word << word 
    end 
  end 
middle_word.join(' ')
end 
```