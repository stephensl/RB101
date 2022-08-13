1. Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

P: 
  - create method that takes string as argument 
  - return ASCII string value of argument
  - input: string
  - output: integer equal to ASCII value 
  - clarify: spaces?

E: 
```ruby 
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
```

D: 
  - array to iterate through string characters

A: 
  - define method `ascii_value` that takes one parameter (string)
  - break string into characters 
  - iterate through characters.. get ascii value of each character
  - add values to sum 
  - output sum 
  - 
  

C: 
```ruby
def ascii_value(str)
  sum = 0 
  str.chars.each do |char|
    sum += char.ord 
  end 
  sum 
end 
```
or

```ruby
def ascii_value(str)
  str.chars.inject(0) { |sum, char| sum + char.ord }
end 
```

2. The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

P: 
  - given integer (positive or negative) 
  - return time of day in 24hr format 
  - input: integer, positive or negative (after or before midnight)
  - output: time in 24hr format hh:mm

E:
```ruby
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
```

D: 

A: 

C: 


2. 


3. 









4. Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped. 

You can assume that every word contains at least one letter and the string will always contain at least one word. You can also assume that easch strin contains nothing but words and spaces. 


P: 
  - given string of words 
  - return string 
     - first and last letters of every word in string swapped. 
  -input: string
     - string of words separated by spaces
  -output: new string
     - first and last letter of each word swapped 
  -Rules: 
    explicit: 
             - input is given string
             - every word contains at least one letter
             - input string will always contain at least one word 
             - string contains nothing but words and spaces. 
             - new string: each word contains first and last letter swapped
    implicit: 
             - string will not contain punctuation. 
             - returned string will be new string 

E: 
```ruby
swap("the hills are alive") == "eht sillh era eliva"
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
```

D: 
  - strings

A: 
  - define method `swap` to take one parameter (string)
  - break string into individual words 
  - select each word from string
  - select first letter and last letter of each word 
  - swap first and last letter of each word 
  - return new string 

C:
```ruby
def swap(str)
  words_array = str.split
  words_array.map do |word| 
    word[0], word[-1] = word[-1], word[0]
  end 
  words_array.join(' ')
end 
```


5. Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 

If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

P: 
  - given string 
  - consists of words (lowercased) and non-alphabetic characters
  - return same string 
    - all non-alphabetic characters replaced by spaces 
  - if one or more non-alpha characters occur in a row..
    - only have one space in the result (no consecutive spaces)
  
  - input: string 
    - lowercased words and non-alphabetic characters
  - output: same string
    - non-alphabetic characters replaced by spaces 
  - rules:
    - explicit:
               - given string words and assorted non-alphabetic chars
               - return same string
               - returned string non-alpha chars replaced by spaces
               - if multiple non-alpha chars occur in row include one space
               - result should never have more than one space in the result
    - implicit: 
               - same string should be returned, not new object
               - may include leading and/or trailing spaces
               - all punctuation should be replaced by space 
               - anything that is not a letter (a..z) should be replaced

E: 
```ruby
cleanup("---what's my +*& line?") == ' what s my line '
cleanup("how's it go-ing, bro?$%") == 'how s it go ing bro '
```

D: 

A: 
  - define method `cleanup` which takes one parameter, string.
  - break string into individual characters and spaces 
  - examine each character of string
  - check to see if each character is alphabetic
    - if so, leave it
    - if not, replace with space 
  - check each character again
  - remove duplicate spaces 
  - convert characters back to string
  - output string 

C: 
```ruby
def cleanup(str)
  string_characters = str.chars
  
  chars_cleaned = string_characters.each do |char|
    if char.between?("a", "z")
      char 
    else 
      char.gsub!(char, " ")
    end
  end 
  
  chars_cleaned.join.squeeze(' ')
end 
```
or
```ruby
ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []
  
  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else 
      clean_chars << " " unless clean_chars.last == " "
    end 
  end 
  
  clean_chars.join
end 
```
or
```ruby
def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end 
```

6. Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

P: 
  - method that takes string
  - string contains one or more space-separated words
  - return hash showing number of words of different sizes 

  - input: string 
    - consists of one or more space-separated words
  - output: hash
    - keys: word length/ values: number of words of that length present 
  - Rules: 
    - explicit:
               - input string with one or more words separated by spaces
               - return hash showing number of words of diff. sizes
               - words consist of any string of characters that don't include   a space 
    - implicit: 
               - punctuation counted as part of word size
               - empty string returns empty hash
               - apostrophe counted as part of word size 
               - keys: word size, values: number of occurences

E: 
```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
```

D: 

A: 
  1. define method word_sizes to take one parameter (string)
  2. initialize empty hash to contain key/value pairs
  3. break string into individual words delimited by spaces
  4. count size of each word 
  5. count number of words of that size 
  6. add to hash key (size of word) value (number of occurences)
  7. return hash 

C: 
```ruby
def word_sizes(str)
  hsh = Hash.new(0)
  
  str.split.each do |word|
    hsh[word.size] += 1
  end 
  hsh
end 
```

7. 
```ruby
def word_sizes(str)
  hsh = Hash.new(0)
  
  str.split.each do |word|
    clean_word = word.delete("^A-Za-z")
    hsh[clean_word.size] += 1
  end 
  hsh
end
```

8. Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

P: 
  - input: array of integers between 0 and 19 
  - return: array of integers sorted based on alphabetic english name. 

E: 
```ruby
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
```

D: arrays, hash to store key value pairs...int and english word

A: 
  - create hash with keys as integers, values as english word for integer
  - initialize empty array to store sorted values 
  - iterate through input array passing each element to block
  - use passed in element to reference existing hash key and paired value
  - pass value of indicated key to new array 
  - sort new array alphabetically
  - iterate through sorted array pass each element to block 
  - use elements as values to reference paired keys from hash
  - transform values into keys
  - return array of keys, sorted 

C: 
```ruby
def alphabetic_number_sort(arr)
  int_word = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
  }
  
  words_array = []
  
  arr.each do |num|
    words_array << int_word[num]
  end 
  
  words_array.sort!
  
  result = words_array.map! do |word|
    int_word.key(word)
  end 
  result 
end 
```
or
```ruby
NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end
```

9. Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. 

You may not use `String#squeeze` or `String#squeeze!``.

P: 
  - input: string 
  - output: new string 
    - all consecutive duplicate characters collapsed to single char. 
  - rules: 
    - explicit: takes string argument
    -           return new string
    -           new string if contains duplicate consecutive char
    -             remove all but one of the duplicate chars in original. 
    - implicit: single char, return char 
    -           empty string, return empty string
    -           spaces? 
  
E: 
```ruby
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
```

D: array


A:
  - define method `crunch` takes one parameter, string
  - check each character in the string to see if it is duplicated    consecutively
    - choose starting char in string
    - compare starting char to next char
  - if next char == current char remove current char. 
  - continue iterating through string
    - next char becomes current char...
  - return new string with consecutive duplicates removed


C: 
```ruby
def crunch(str)
  result = []
  index = 0 
  
  while index <= str.length - 1
    result << str[index] if str[index] != str[index + 1]
    index += 1
  end 
    result.join
end 
```
using each_char

```ruby
def crunch(str)
  clean_string = ""
  
  str.each_char do |char|
    clean_string << char unless clean_string[-1] == char 
  end 
  clean_string
end 
```
using chars and select
```ruby
def crunch(string)
  saved = ''
  new_string = string.chars.select do |x|
    if x == saved
      false
    else
      saved = x
      true
    end
  end
  new_string.join
end
```

10. 