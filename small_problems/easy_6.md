1. Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

P: 
  - input: float number 
    - represents angle between 0 and 360 degrees
  - output: string
    -represents angle in degrees, minutes, and seconds 
  - rules:
          - string formated with degree symbol, ', and ""

E: 
```ruby
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
```


2. Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

P: 
    -input: array of strings 
    - output: new array of the same string values with vowels removed

E: 
```ruby
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```

D: arrays 

A: 
  1. select each string within the array 
  2. check each character to see if it is a vowel
  3. if not a vowel, push to new array 
  4. once checked every character and pushed all non-vowels to new array
    - return new array 

C: 
```ruby 
def remove_vowels(arr)
  non_vowels = []
  arr.each do |str| 
    non_vowels << str.delete("AEIOUaeiou")
  end 
  non_vowels
end 
```
or 
```ruby
def remove_vowels(arr)
  arr.map { |str| str.delete("aeiouAEIOU")
end 
```

3. Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

P: 
  - input: integer greater than or equal to 2
  - output: integer (index of first Fib number with arg number of digits)
  - rules: 
          - argument specifies a number of digits 
          - fib numbers follow sequence starting with 1, 1, 2, 3, 5, 8, 13 ...
          - output will be index
          - first fib number has index 1

E: 
  ```ruby
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12       # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
```

D: 

A: 
 1 create fibonacci loop (extracted)
 2 check number of digits
 3 when fib number has same number of digits as indicated by argument 
 4 return index of that number 
 5 Track.. fib number, and index in loop 


***extracted step 1:***

create fibonacci loop that generates fib numbers 
fib numbers follow pattern.. 
  first two numbers are 1
  next number is sum of two previous numbers 
  
A: 
  1. create array starting with two integers [1, 1] to begin fib sequence
  2. sum first two integers to get third fib number, add to array 
  3. use next two numbers to generate 4th fib number
  4. repeat until fib number.to_s.size == arg.to_s.size 
  5. 
  


C: 
```ruby
def find_fibonacci_index_by_length(arg)
  index = 0 
  fib_nums_arr = [1, 1]
  
  loop do 
    next_fib_num = fib_nums_arr[index] + fib_nums_arr[index + 1]
    fib_nums_arr << next_fib_num 
    index += 1
    break if (fib_nums_arr[-1]).to_s.size == arg
  end 
  target_element_index = fib_nums_arr.find_index(fib_nums_arr.last)
  fib_index = target_element_index + 1
  return fib_index 
end 
```
or 
```ruby
def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end
```

4. Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object. (can't use reverse.)

P: 
  - input: array 
  - output: original array with elements reversed 
  - Rules:
  -       - cannot use reverse method
  -       - returned array should be same object as argument 
  -       - chars within strings should not be reversed, only element order
  -       - empty array returns empty array 

E: 
```ruby 
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
```


D: arrays 

A: 
  1. 


5. 













6. Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

P: 
  -input: two arrays 
  -output: new array
  
C: 
```ruby
def merge(arr_1, arr_2)
  (arr_1 + arr_2).uniq
end 
```
or
```ruby
def merge(arr_1, arr_2)
  arr_1 | arr_2
end 
```

7. Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

P: 
  - given array 
  - return two arrays nested in larger array 
  - first nested array contains first half of elements from original arr
  - second nested array contains second half elements from original arr 
  - if given array has odd num elements, middle element place in first arr 
  - 
  - input: array 
  - output: nested array 
  -   [[x, x, x], [y, y, y]]

E: 
```ruby
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
```

D: arrays 

A: 
  1. define method to take one parameter (arr)
  2. initialize three empty arrays:
     - parent array
     - sub1 array
     - sub2 array 
  3. check to see if original array size is odd or even
  4. create if statement
     - if original array size is odd
        - add elements up to index of arr.size/2 to sub1 array 
     - if original array size is even 
        - add elements up to index of arr.size/2 - 1 to sub 2
  5. append sub1 and sub2 to parent array 
  6. return parent array 

C:
```ruby
def halvsies(orig_array)
  sub_1_arr = []
  sub_2_arr = []
  
  if orig_array.size.odd?
    sub_1_arr << orig_array[0..(orig_array.size) / 2]
    sub_2_arr << orig_array[(orig_array.size / 2) + 1..-1]
    return sub_1_arr + sub_2_arr
  else 
    sub_1_arr << orig_array[0..(orig_array.size / 2) - 1]
    sub_2_arr << orig_array[(orig_array.size) / 2..-1]
    return sub_1_arr + sub_2_arr
  end 
end 
```

8. Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

C: 
```ruby
def find_dup(arr)
  dupes = arr.select do |value|
    arr.count(value) == 2
  end 
  dupes.uniq.last
end
```
or
```ruby
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
```

9. Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.


P: 
  - input: array and search value 
  - output: boolean
            - whether or not the search value is present in the array 
  - rules: 
         - cannot use `include?` method. 

E: 
```ruby
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
```

D:
  - array 

A:
  1. define method `include?` to take two parameters. (arr, search_value)
  2. set index = 0
  2. start loop through array
  3. check if item at current index in the array equal to search value
    - if yes..break out of loop and return true.
    - else, break if index == array.size 
    - return false


C: 
```ruby 
def include?(array, search_value)
  index = 0 
  
  while index < array.size 
    return true if array[index] == search_value 
    index += 1
  end 
  false 
end 
```
or 
```ruby 
def include?(array, value)
  !!array.find_index(value)  # !! forces boolean equivalent of returned value
end 
```

10. Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. 

The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

P: 
  - input: positive integer 
  - output: string of * from 1 to input number incremented on separate lines

  - output will have number of lines == input integer 
  - *s will start at 1.. placing one * that is input integer number of spaces
  - subsequent lines will increment *s by 1
    - placement will start at input integer number of spaces -1 up to input integer number of spaces from left to right 
  - final line will have input integer number of *s starting from 1st space

E: 
```ruby
triangle(3)

--*  
-**
***

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
```

D: strings

  what we know..
    - first '*' placed integer spaces from left to right 
    - next line places first '*' at int number spaces -1 up to integer spaces
    - increment by 1 star each line
    - end when line contains int number of stars
    
A: 
  1. define method `triangle` that takes one parameter (positive integer)
  2. move int spaces from left to right 
  3. place first `*` at space int on first line
  4. increment number of `*` for next line 
  5. decrease number of spaces for next line before first `*`
  6. break when number of `*` == int

C:
```ruby
def triangle(int)
  space = " "
  star = '*'
  num_stars = 1 
  num_spaces = int - 1
  
  until num_stars > int
    puts "#{space * num_spaces + star * num_stars}"
    num_stars += 1
    num_spaces -= 1
  end 
end 
```

