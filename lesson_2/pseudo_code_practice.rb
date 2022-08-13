# write out pseudo code (both casual and formal) that does the following:
# a method that returns the sum of two integers
# a method that takes an array of strings and returns string that is all strings concatenated together
# a method that takes an array of integers, and returns an array with every other element


# method that returns sum of two integers

# informal

Collect two integers, or use given two integers
  -Save integers to local variables
Add the integers together using local variables containing integers and save sum to a third variable
Print the third (sum) variable

# formal

START

PRINT string requesting the user to enter first integer
GET integer and SET = integer_1

PRINT string requesting the user to enter second integer
GET integer and SET = integer_2

SET sum = integer_1 + integer_2

PRINT sum

END

# a method that takes an array of strings and returns string that is all strings concatenated together

# informal

Given an array of strings

Iterate through array string by string
  - save first string as first value
  - for each iteration add string to existing saved string
  - break when reach the end of the array
After iterating through strings in the array, return the saved value of concatenated strings

# formal

START

# Given an array of strings

SET array of strings = array
SET iterator = 1

WHILE iterator <= number of strings in array
  SET current_string = value within array at space "iterator"
  iterator += 1
  
  PRINT string
  
  END
  
# a method that takes an array of integers, and returns an array with every other element

# informal

Given an array of integers

Save iterations = 0
Iterate over array one by one incrementing iteration by 1
Skip when iterations are even
Save odd iteration integers to new array
Return new array

# formal

START

# Given array of integers

SET iterator = 0
SET new_array = value within array at space 1

While iterator == odd
  SET new_array = value within iteration
  IF iterator.even? 
    go to next iteration

iterator += 1

PRINT new_array

END