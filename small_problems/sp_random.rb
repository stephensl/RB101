# =begin

# Problem:

# Given an array of integers. Take the array and find an index N where the sum of the integers to the left of N is equal to the sum of integers to the right of N. IF there is no index that would make this happen, return -1.

# Example:

# Given the array: [1, 2, 3, 4, 3, 2, 1] the method should return index 3, because at the third position of the array the sum of the left side of the index [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

# Given the array [20, 10, -80, 10, 10, 15, 35]
# at index 0, the left side is []
# The right side is  [10, -80, 10, 10, 15, 35]
# They are both equal to zero when added- empty arrays count as zero for this problem. Index 0 is the place where the left and right side are equal.

# p even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p even_index([1, 100, 50, -51, 1, 1]) == 1
# p even_index([1, 2, 3, 4, 5, 6]) == -1
# p even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p even_index([20, 10, -80, 10, 10, 15, 35] == 0


# P: Given array of integers.. find index of integer where the sum of integers to the left of the index is equal to the sum of integers to the right of the index.
# - input: array of integers
# - output: single integer (index) or -1 if target index does not exist
# - rules:
#        - empty array counts as zero
#        - sum of integers to left of index == sum of integers to the right

# E:
# p even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p even_index([1, 100, 50, -51, 1, 1]) == 1
# p even_index([1, 2, 3, 4, 5, 6]) == -1
# p even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p even_index([20, 10, -80, 10, 10, 15, 35] == 0

# D: input: array
#    intermed: array
#    output: single integer -1 ..

# A:
# - define method to take one parameter (array)
# - init left sum = nil
# - init right sum = nil
# - start at index 0 of input array  (if at index 0, left sum == 0) if index == array.length - 1 right sum 0
#  - sum values to left of index, and right of index
#  - compare..
#     - if sums are equal, return current index
#     - if not, increment index by 1, contimue iteration.
# - if no equal sums found after index == array.size -1
#  -return -1

# C:
# =end
# # require 'pry'
# # def even_index(array)
# #   index = 0

# #   while index < array.size
# #     left_sum = array[0...index].sum
# #     right_sum = array[index + 1..-1].sum

# #     return index if left_sum == right_sum

# #     index += 1
# #     left_sum, right_sum = nil, nil
# #   end
# #   -1
# # end













# # p even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# # p even_index([1, 100, 50, -51, 1, 1]) == 1
# # p even_index([1, 2, 3, 4, 5, 6]) == -1
# # p even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# # p even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# # p even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# # p even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# # def is_palindrome?(str)
# #   str == str.reverse
# # end

# # def long(string)
# #   result = []

# #   0.upto(string.length - 1) do |start_index|
# #     start_index.upto(string.length - 1) do |end_index|
# #     result << string[start_index..end_index]
# #     end
# #   end
# #   palindromes = result.select do |substring|
# #     is_palindrome?(substring)
# #   end
# #   sorted = palindromes.sort_by {|pal| pal.size}
# #   sorted.last.size

# # end

# # p long('baablkj12345432133d') == 9



# # Given two strings..find out if there is a substring that appears in both strings.
# # If there is a substring that appears in both return true, else false.
# # Only return substrings longer than one letter long.


# # P:
# # -input: two strings
# # -output: boolean
# # - rules:
# #         - case insensitive
# #         - substring must be at least two chars long
# #         - substring must be in sequence with matched substring

# # E:
# # sub_test('Something', 'Fun') == false
# # sub_test("Something", "Home") == true
# # sub_test("Something", '') == false
# # sub_test('', 'Something') == false
# # sub_test('BANANA', 'banana') == true
# # sub_test('test', 'lllt') == false
# # sub_test('1234567', '541265') == true


# # D: input: strings
# #   intermed: array, strings
# #   output: boolean

# # A:
# # - define method sub_test to take two parameters (strings)
# # - initialize two empty arrays to push substrings to
# # - find all substrings greater than two characters
# # - save all substrings of each string to respective arrays
# # - iterate through arrays
# #   - check if substrings in one are equal to any substring in other
# #   - if yes, return true,
# #   - else, false



# # def sub_test(str1, str2)
# #   substrings_1, substrings_2 = [], []

# #   substrings_1 = find_all_substrings(str1)
# #   substrings_2 = find_all_substrings(str2)

# #   substrings_1.each do |sub|
# #     return true if sub.size > 1 && substrings_2.include?(sub)
# #   end
# #   false
# # end


# # def find_all_substrings(str)
# #   result = []

# #   0.upto(str.length - 1) do |start_index|
# #     start_index.upto(str.length - 1) do |end_index|
# #       result << str[start_index..end_index].downcase
# #     end
# #   end
# #   result
# # end












# # p sub_test('Something', 'Fun') == false
# # p sub_test("Something", "Home") == true
# # p sub_test("Something", '') == false
# # p sub_test('', 'Something') == false
# # p sub_test('BANANA', 'banana') == true
# # p sub_test('test', 'lllt') == false
# # p sub_test('1234567', '541265') == true




# # Write method, scramble(str1, str2) that returns true if a portion of str1 chars can be arranged to match str2, otherwise return false.

# # For example: 'rkqodlw', 'world' should return true

# # only lowercase letters will be used (a-z). no punctuation or digits included.


# # P:
# # return true if characters in str1, can be rearranged to equal str2.
# # input: two strings
# # output: boolean
# # rules:
# #       - strings will be lowercase alphabetic characters (a-z)
# #       - no punctuation, spaces, or digits included in string
# # questions: what about empty strings? return true or false?
# # * checking to see if every char in str2 is present in str1


# # E:
# # p scramble('javaass', 'jjss') ==   # number of chars matter.. two js here in str2, one in str1
# # p scramble('rkqodlw', 'world') == true
# # p scramble('cedewaraaossoqqyt', 'codewars') == true
# # p scramble('katas', 'steak') == false
# # p scramble('scriptjava', 'javascript') == true
# # p scramble('scriptingjava', 'javascript') == true


# # D:
# # input: strings
# # intermed: array
# # output: boolean


# # A:
# # - define scramble to take two param (strings)
# # - initialize empty hash
# # - iterate through str2, create hash with key (char) value (count)
# # - iterate through str1, check if each key in str2 hash is present in str1
# #   - check to see if str1 contains each key in str2 hash at least value number of times
# # - if str1 contains each key from str2 hash and keys are present at least value times in str1, return true
# # - else return false.


# # def scramble(str1, str2)
# #   str2_char_count_hash = {}
# #   boolean_arr = []

# #   str2.chars.each do |char|
# #     str2_char_count_hash[char] = str2.count(char)
# #   end

# #   str2_char_count_hash.each do |key, value|
# #     boolean_arr << (str1.count(key) >= value)
# #   end
# #   boolean_arr.all?(true)
# # end

# # p scramble('javaass', 'jjss') == false  # number of chars matter.. two js here in str2, one in str1
# # p scramble('rkqodlw', 'world') == true
# # p scramble('cedewaraaossoqqyt', 'codewars') == true
# # p scramble('katas', 'steak') == false
# # p scramble('scriptjava', 'javascript') == true
# # p scramble('scriptingjava', 'javascript') == true



# # The maximimum sum subarray problem consists of finding the maximum sum of a contiguous subsequence in an array of integers.

# # - given an array.. find maximum sum of consecutive integers
# # ex. [-2, 1, -3, 4, -1, 2, 1, -5, 4]  == 6...[4, -1, 2, 1]




# # P:
# # - input: array
# # - output: integer (max sum of subset of consecitive numbers)
# # - rules:
# #           - if only negative numbers return 0
# #           - if all positive return sum of array
# #           - empty array has sum 0
# #           - if only one positive integer, return integer
# #           - if only one negative integer return 0.

# # E:
# # max([]) == 0
# # max([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# # max([11]) == 11
# # max([-32]) == 0
# # max([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# # D:
# # - input: array
# # - intermed: sub_arrays
# # - output: integer (sum of certain sub_array)


# # arr = [1, 2, 3]
# # sub_arr = [[1], [1, 2], [1, 2, 3], [2], [2, 3], [3]]



# # A:
# # - define method max to take one parameter (array)
# # - initialize all_sub_arrays array []
# # - find all consecutive sub_arrays of input array
# # - sum each sub_array
# # - return greatest sum

# # if array is empty, return 0
# # - if array has only negative num, return 0
# # - if array has all positive num, return sum of input arr



# # def max(arr)
# #   all_sub_arrays = find_all_subs(arr)
# #   greatest_sum = 0

# #   all_sub_arrays.each do |sub_arr|
# #     greatest_sum = sub_arr.sum if sub_arr.sum > greatest_sum
# #   end

# #   greatest_sum
# # end

# # def find_all_subs(arr)
# #   result = []

# #   0.upto(arr.size - 1) do |start_index|
# #     start_index.upto(arr.size - 1) do |end_index|
# #       result << arr[start_index..end_index]
# #     end
# #   end
# #   result
# # end

# # p max([]) == 0
# # p max([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# # p max([11]) == 11
# # p max([-32]) == 0
# # p max([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12


# # Write a method to find the longest common prefix string amongst an array of strings.

# # If no common prefix, return empty string.

# # ex:
# # common(['flower', 'flow', 'flight']) == 'fl'
# # common(['dog', 'racecar', 'car']) == ''
# # common(['interspecies', 'interstellar', 'interstate']) == 'inters'
# # common(['throne', 'dungeon']) == ''
# # common(['throne', 'throne']) == 'throne'

# # prefix, start at beginning of string..


# # P:
# # input: array of strings
# # output: prefix substring
# # rules:
# #       - if no common prefix, return empty string
# #       - prefix substrings start with first char of word...
# #       - prefix substring must be contiguous
# #       - all input lowercase (a-z)
# #       - empty array return empty string
# #       - if first char in each string is not same, return empty string

# # E:
# # common(['flower', 'flow', 'flight']) == 'fl'
# # common(['dog', 'racecar', 'car']) == ''
# # common(['interspecies', 'interstellar', 'interstate']) == 'inters'
# # common(['throne', 'dungeon']) == ''
# # common(['throne', 'throne']) == 'throne'


# # D:
# # - input: array
# # - intermed: array
# # - output: string


# # A:
# # - define method common to take one param (array of strings)
# # - check if first character in all strings is same..
# #   - if not, return empty string
# # - initialize an all_leading_substr array
# # - push all leading substrings from each string into all_leading_substr array
# # - iterate through leading_subs array, count occurrences of leading substrings
# #   - if occurences of leading substring == array.size
# #   - push to result array
# #   -iterate through result array, select longest leading substring.
# # - return longest substring length

# # C;
# # require 'pry'
# # def common(array)
# #   common_prefixes = []
# #   if first_letter_common?(array) == false
# #     return ''
# #   end

# #   total_leads = []
# #   array.each do |string|
# #     total_leads << all_leading_substrings(string)
# #   end

# #   leads_flat = total_leads.flatten
# #   leads_flat.each do |str|
# #     if leads_flat.count(str) == array.size
# #       common_prefixes << str
# #     end
# #   end
# #   sorted = common_prefixes.sort_by { |prefix| prefix.length }
# #   return sorted[-1]
# # end


# # def first_letter_common?(arr)
# #   first_letter = arr[0][0]
# #   if arr.include?('') then return false
# #   end
# #   arr.all? { |str| str.start_with?(first_letter) }
# # end

# # # p first_letter_common?(['abc', 'arb', 'axs', 'ab'])
# # # p first_letter_common?(['abc', 'arb', 'axs', 'b'])


# # def all_leading_substrings(str)
# #   result = []

# #   0.upto(str.size - 1) do |end_index|
# #     result << str[0..end_index]
# #   end
# #   result
# # end

# # # p common(['flower', 'flow', 'flight']) == 'fl'
# # # p common(['dog', 'racecar', 'car']) == ''
# # # p common(['interspecies', 'interstellar', 'interstate']) == 'inters'
# # # p common(['throne', 'dungeon']) == ''
# # # p common(['throne', 'throne']) == 'throne'
# # #common(['', '', ''])


# # Create a method that takes a positive integer number and returns the next bigger number formed by the same digits.

# # ex. 12 --> 21
# #     513 --> 531
# #     2017 --> 2071
# #     if no bigger number composed using those digits return -1
# #     9 --> -1
# #     111 --> -1
# #     531 --> -1

# # P:
# # - input: positive integer
# # - output: positive integer (next largest number using same digits)
# # - rules:
# #         - must only use digits from input number
# #         - if input num is single char return -1 as it is the largest
# #         - return next biggest number, not biggest possible number
# #         - if cannot create larger number from digits, return -1

# # E:
# # next_bigger(12) == 21
# # next_bigger(9) == -1
# # next_bigger(513) == 531
# # next_bigger(2017) == 2071
# # next_bigger(111) == -1
# # next_bigger(123456789) == 123456798


# # D:
# # - input: positive integer
# # - intemed: array
# # - output: integer positive or -1

# # A:

# # - define method to take one arg (integer)
# # - find all combinations of digits
# #   - push to array
# # - sort digit array
# # - filter out nums less than integer
# # - sort remaining nums
# # - choose smallest num that is larger than integer
# # - return num

# # C:

# # def next_bigger(int)
# # all_permutations = get_all_permutations(int)

# # larger_integers = all_permutations.select do |sub_arr|
# #   sub_arr.join.to_i > int
# # end

# # if larger_integers.empty? then return -1
# # end

# # integers = larger_integers.map do |subarray|
# #   subarray.join.to_i
# # end

# # sorted = integers.sort
# # sorted[0]
# # end



# # def get_all_permutations(int)
# #   perm_array = []
# #   digit_array = int.digits

# #   digit_array.permutation do |perm|
# #     perm_array << perm
# #   end

# #   perm_array
# # end

# # p next_bigger(12) == 21
# # p next_bigger(9) == -1
# # p next_bigger(513) == 531
# # p next_bigger(2017) == 2071
# # p next_bigger(111) == -1
# # p next_bigger(123456789) == 123456798



# =begin
# A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of
# the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word,
# which is always capitalised.


# Write a function that will convert a string into title case, given an optional list of exceptions (minor words).

# The list of
# minor words will be given as a string with each word separated by a space. Your function should ignore the case of the
# minor words string -- it should behave in the same way even if the case of the minor word string is changed.
# =end


# # P: write method that takes a string and an optional argument (minor words) convert the first letter of each word in the string to uppercase, and the rest of the characters in each word will be lowercase.
# #    If minor words included in argument, ignore those words.

# #    input: string..possibly two strings
# #    output: string
# #    rules:
# #          - first letter of input string must be capitalized (even if minor word)
# #          - capitalize the first letter of each word in the string
# #          - words delimited by spaces
# #          - optional argument of minor words to leave alone, and not capitalize
# #    questions: assume empty string returns empty string

# # E:
# # # p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
# # # p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
# # # p title_case('the quick brown fox') == 'The Quick Brown Fox'


# # D: input: strings
# #    intermed: array
# #    output: string

# # A:
# #  -define method to take one param, and one optional param
# #  - downcase input string
# #  split string into an array- each word separate element in array
# #    start with first word
# #       -capitalize
# #    - move to next word..
# #       check if word is included in the minor words string
# #          if so, move to next word
# #             if not, capitalize
# #    - convert array back to string amnd return

# require 'pry'
# def title_case(string, minor_cases = '')
#    results_array = []
#    downcased_string = string.downcase
#    minor_cases.downcase!
   

#    array_of_strings = downcased_string.split

#    array_of_strings.each_with_index do |string, index|
#       if index == 0 
#          results_array << (string.capitalize) 
#       elsif !(minor_cases.include?(string))
#          results_array << (string.capitalize)
#       else 
#          results_array << string
#       end     
#    end
#  p results_array.join(' ')
# end






# title_case('"First a of in", "an often into")


















































# # # Given a string of words, you need to find the highest scoring word.
# # # Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.
# # # You need to return the highest scoring word as a string.
# # # If two words score the same, return the word that appears earliest in the original string.
# # # All letters will be lowercase and all inputs will be valid.
# # # =end

# # # p: input: string of words..
# # #    output: string (highest score)
# # #    rules:
# # #          - every letter is assigned points based on alpha position
# # #          - find word with highest point value
# # #          ****if two words have same point value, return earlier occuring word
# # #          - all letters will be lowercase and valid
# # #          - spaces have no point value
# # # E:
# # # # p high('man i need a taxi up to ubud') == 'taxi'
# # # # p high('what time are we climbing up the volcano') == 'volcano'
# # # # p high('take me to semynak') == 'semynak'
# # # # p high('aaa b') == 'aaa'

# # # d: input: string of lowercase alphabetic letters
# # #    intermed: hash (a-z) keys and points as values
# # #    output: string (highest scoring)

# # # A:
# # # - define method to take one parameter
# # # - generate hash (a-z) (1-26)
# # #  - init points array
# # # - split string into array of words
# # # - iterate through each word
# # #    - iterate through each char of word
# # #    - determine points per character and sum for word
# # #    - save sum to points array for each word
# # # - find index in points array of largest value
# # # - return string at that index.


# # # C:

# # # def high(string)
# # #    alpha_point_hash = make_alpha_point_hash
# # #    points_arr = []

# # #    words_arr = string.split

# # #    words_arr.each do |word|
# # #       char_points = []
# # #       word.each_char do |char|
# # #          char_points << alpha_point_hash[char]
# # #       end
# # #       points_arr << char_points.sum
# # #    end
# # #  largest_str_index = points_arr.index(points_arr.max)
# # #  words_arr[largest_str_index]
# # # end



# # # def make_alpha_point_hash
# # #    letters = ('a'..'z').to_a
# # #    points = (1..26).to_a

# # #    hash = letters.zip(points).to_h
# # #    hash
# # # end

# # #  p high('man i need a taxi up to ubud') == 'taxi'
# # #  p high('what time are we climbing up the volcano') == 'volcano'
# # #  p high('take me to semynak') == 'semynak'
# # # p high('aaa b') == 'aaa'
=begin
=end

# Complete the solution so that the function will break up camel casing, using a space between words.

# P: 
# - Given a string in camelCase, return a new string in which camelCased words are separated by a space. 
# - input: string
# - output: new_string
# - rules:
#        - camel cased word should be split after last lowercase letter and before first uppercase letter 
#        - empty string returns empty string 
      
# E:
# p camel("camelCasing") == "camel Casing"
# p camel("identifier") == "identifier"
# p camel("") == ""

# D: 
# input: string in camel case
# intermed: possibly array 
# output: new string

# A: 
# - split string into array of chars
# - init results array 
# - iterate through array of characters by index 
#    - add each char to results array until reach upcased char 
#       -when reach upcased char add " " + char to results array 
# - continue through rest of array
# - return joined array 


# C: 

# def camel(string)
#   chars_arr = string.chars 
#   results = []
  
#   chars_arr.each_with_index do |char, idx|
#     if char == char.upcase
#       results << " " << char 
#     else 
#       results << char 
#     end 
#   end 
#   results.join 
# end 
      





# p camel("camelCasing") == "camel Casing"
# p camel("identifier") == "identifier"
# p camel("") == ""



# Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of
# characters then it should replace the missing second character of the final pair with an underscore ('_').



# P: 
# split string into array of substrings of two chars each
# if string has odd num letters, use '_' as second part of substring 

# input: string 
# output: array of substrings
# rules: 
#       - array will be made up of substrings of two chars in length 
#       - if string.length is odd, insert '_' to complete final pair. 

# E:
# p solution('abc') == ['ab', 'c_']
# p solution('abcdef') == ['ab', 'cd', 'ef']
# p solution("abcdef") == ["ab", "cd", "ef"]
# p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
# p solution("") == []

# d: 
# input: string
# intermed: array 
# output: array 

# A: 
# init results array 
# init start and end index
# iterate through string char by char from start to end. 
# increment start and end by 2.
# require 'pry'

# def solution(string)
#   result = []
#   0.upto(string.length - 1) do |index|
#       result << string[index] + string[index + 1] unless string[index + 1] == nil
#     if index == string.length - 1
#       result << char[index] + '_'
#     end 
#   end 
# p result 
# end 

# p solution('abc') == ['ab', 'c_']
# p solution('abcdef') == ['ab', 'cd', 'ef']
# p solution("abcdef") == ["ab", "cd", "ef"]
# p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
# p solution("") == []







# Given non-empty string, check if it can be constructed byh taking a substring of it and appending multiple copies of the substring together. assume string consists of lowercase english letters only.

# input: 'abab'
# output: true... substring 'ab' * 2 
# input: 'aba'
# output: false - no repeating substring. 


# P:
# input: string 
# output: boolean (whether or not a substring can be repeated to equal string)
# rules: 
#       - substring must be sequential.
#       - substring * num must equal input string
#       - lowercase letters only in input string 
#       - string == substring * n 
#       - string.length / substring.length == n 
#         6 / 2 ==== n == 3 
        
#     - iterate from string[0]..string[string.size / 2]
        
# E: 
# repeat('abab') == true
# repeat('aba') == false
# repeat('aabaaba') == false
# repeat('abaababaab') == true
# repeat('abcabcabcabc') == true

# D: 
# input: string 
# intermed: array 
# output: boolean


# A: 
# - define method to take one argument string 
# - find all substrings from start to halfway through string 
# - for each substring 
#   - string.length / substring.length == n 
#   - substring * n == string? 


# find_substrings(string)

# def repeat(str)
  
#   substrings = find_substrings(str)
  
#   substrings.each do |substr|
#     n = str.length / substr.length
#     return true if substr * n == str
#   end 
  
#   false 
# end 

# def find_substrings(str)
#   result = []
  
#   0.upto(str.length / 2) do |start_index| 
#     start_index.upto(str.length / 2) do  |end_index| 
#       result << str[start_index..end_index]
#     end 
#   end 
#   result
# end 
  
  
# p repeat('abab') == true
# p repeat('aba') == false
# p repeat('aabaaba') == false
# p repeat('abaababaab') == true
# p repeat('abcabcabcabc') == true


# given array of strings made only from lowercase letters. 
# return array of all chars that show up in all strings within the given array (including duplicates)

# P: 
# - input: array of strings 
# - output: array of chars (included in all strings)
# - rules: 
#         - if char is present within all strings in array.. include in new array 
#         - include duplicates if char present more than once in all strings in array 
#         - if no chars meet criteria, return empty array 
#         - return chars in new array in order of appearance in first string in given array 

# E: 
# common(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# common(['cool', 'lock' 'cook']) == ['c', 'o']
# common(['hello', 'goodbye', 'booya', 'random']) == ['o']
# common(['aabbaaa', 'ccddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) = []

# D:
# input: array of strings
# intermed: 
# output: array of common chars 

# A: 
# - define method to take one param
# - init common_char  array = []

# # build common char array 
# - starting with first string...
#   - iterate through beginning at first char 
#   - check if selected char is present in other strings in array 
#   - if is present in all.. push char to common_char array ### duplicates 
# ###

# - return array of common chars 


# C: 
# require 'pry'
# def common(array)
#   array = array.map { |word| word.dup }
  
#   chars = array.shift.chars
  
#   chars.select do |char|
#     array.all? { |word| word.sub!(char, '') } 
#     binding.pry
#   end 
# end 

# p common(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# # common(['cool', 'lock' 'cook']) == ['c', 'o']


# Given two words, how many letters do you have to remove from them to make them anagrams?

# First word : c od e w ar s (4 letters removed)
# Second word : ha c k er r a nk (6 letters removed)
# Result : 10
# Hints
# A word is an anagram of another word if they have the same letters (usually in a different order).
# Do not worry about case. All inputs will be lowercase.
# =end
# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('', 'a') == 1
# p anagram_difference('ab', 'a') == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
# p anagram_difference('aab', 'a') == 2
# p anagram_difference('a', 'aab') == 2
# p anagram_difference('codewars', 'hackerrank') == 10




# P: 
# input: two strings 
# output: integer (how many char must be removed to be anagram)
# rules: 
#       - anagram has exact same letters 
#       - all input lowercase 
#       - if input strings == return 0
#       - return value should be total of all chars removed from both strings 
      








# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.



# P:
# input: string 
# output: hash 
# rules: 
#       - returned hash should have three key value pairs
#         - lowercase => %, uppercase => %, neither => %
#       - all lowercase alphabetical chars should be included in lowercase key/value pair
#       - all uppercase alphabetical chars should be included in uppercase key/value pair
#       - chars that are spaces or non-alphabetic should be included in neither kv pair
#       - assume string always contains one or more characters 

# E:
# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# D: 
# input: string 
# output: hash 

# A: 
# - define method letter_percentages to take one param (string)
# - initialize empty hash
# - determine string length and save to local var 
# - count number of lowercase letters, save to lowercase_count
# - count number of uppercase letters, save to uppercase_count
# - count number of neither letters, save to neither_count
# - add key/values to hash 
#   - key: uppercase => value == (uppercase_count / string.length.to_f) x * 100 
# - add key values for each..
# return hash 


# C: 
# require 'pry'
# def letter_percentages(str)
#   percentages_hash = {}
#   str_size = str.length.to_f
#   byebug
#   lowercase_chars_count = str.count('a-z')
#   uppercase_chars_count = str.count('A-Z')
#   neither_chars_count = str.count('^a-zA-Z')
  
#   percentages_hash[:lowercase] = ((lowercase_chars_count / str_size) * 100).round(1) 
#   percentages_hash[:uppercase] = ((uppercase_chars_count / str_size) * 100).round(1)
#   percentages_hash[:neither] = ((neither_chars_count / str_size) * 100).round(1) 
  
#   percentages_hash
# end 


# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
# p letter_percentages('abcdefGHI')



=begin
1. # Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

P:
- input: array of numbers 
- output: array
- rules: 
        - looking for count of numbers smaller than each number in array
        - only count each number once..unique values 
        - returned array is equal in size to input array
        - count for each number should be returned in corresponding index order
        = return array is new array containing counts
        - if only one element in input array return 0. 
        - empty array, return empty array
        - input will be flat array


E:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

D: 
-input: array 
- intermed: results array to be returned
            unique elements array (for counting)
- output: new array 

A: 
- define method to take one parameter (array)
- initialize empty results array 
- create a unique values array (for determining counts)
- iterate through input array 
  - for each element, count numbers < element in unique values array 
  - push this count to results array 
- repeat for each number in input array 
- return results array 


C: 
=end

# def smaller_numbers_than_current(array)
#   results = []
#   unique_values_array = array.uniq 
  
#   array.each do |num|
#     results << unique_values_array.count { |value| value < num }
#   end 
#   results 
# end 










# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]































# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.



=begin

P: input: array of integers (pos or negative)
   output: integer or nil 
   
   rules: 
        - looking for minimum sum of 5 consecutive integers in input array 
        - if array contains less than 5 integers, return nil 
        - minimum sum is smallest sum of 5 numbers in a row.
        - empty array return nil 
        
# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10



D: input: array of integers
   intermed: subarrays of 5 elements 
   output: single integer (minimum sum of 5 consec. nums)
   
A: 
- define method to take one param. (array)

- check size of input array
  - if less than 5, return nil 
- if size of input array is 5 or greater..
- create all combinations of 5 consecutive elements 
  - iterate through input array 
  = start index 0..(arr.size - 5)
  - end index start index + 4..-1 
- save sum of first subarray to min sum
- for each subsequent subarray sum.. compare to min_sum. 
  - if current sum < min_sum...current_sum = min_sum 
- after all iterations
- return minimum sum 

C: 
=end

# def minimum_sum(array)
#   if array.size < 5
#     return nil 
#   end 
  
#   sub_arrays = find_sub_arrays(array)
#   sum_of_subs = []
  
#   sub_arrays.each do |sub_arr|
#     sum_of_subs << sub_arr.sum 
#   end 
  
#   sum_of_subs.min
# end 

  

# def find_sub_arrays(array)
#   max_start_index = array.size - 5
#   sub_arrays = []
  
#   0.upto(max_start_index) do |start_index|
#       sub_arrays << array[start_index..(start_index + 4)]
#     end 
#   sub_arrays
# end 
  

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10




# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


# P: input: string 
#   output: string (second char in every third word uppercased)
#   rules: - input will be string
#           - string will contain uppercase and lowercase letters (a-z)
#           - returned string should contain same sequence of words 
#           - for every third word, every second char in that word is uppercased.
#           - if string is less than 3 words long, return input string 
#   questions: - if letter is already uppercase, assume remains uppercase 
#               - empty string return empty string 
              
# E: 

# D: input: string 
#   intermed: array 
#   output: string 
   
# A: 
# - define method to take one parameter
# - split string into array of words
# - check to see if array contains at least 3 words 
# -   if array is less than 3 words long, return input string 
# - iterate through words in the array 
# - for every third word.. first word will be at index 2)
#   - iterate through the chars in that word 
#   - upcase every other char, starting at word[1]
# - once iteration is complete 
# - join the array back to string 
# - output the string 


# def to_weird_case(string)
#   words_arr = string.split
  
#   if words_arr.size < 3
#     return string 
#   end 
  
#   target_index = 2
#   results = []
  
#   words_arr.each_with_index do |word, index|
#     if index != target_index 
#       results << word 
#     else 
#       results << upcase_every_other_char(word)
#       target_index += 3
#     end
#   end 
#   results.join(' ')
# end 

# def upcase_every_other_char(str)
#   chars_arr = str.chars
#   results = []
  
#   chars_arr.each_with_index do |char, index|
#     if index.even?
#       results << char 
#     else 
#       results << char.upcase 
#     end 
#   end 
#   results.join
# end
  
# # p upcase_every_other_char('fisherman')  


# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'



