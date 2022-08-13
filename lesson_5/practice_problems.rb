Lesson 5.5 
Practice Problems: Sorting Nested Collections and Working with Blocks


1. How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']


P: 
Input: Given array of number strings. 
Output: Array of number strings sorted by descending numeric value
Assuming we are outputting a new array as a result, rather than mutating original. 

E: 
For given array.. output would be ["11", "10", "9", "8", "7"]

D: 
Data structures utilized are arrays, strings as elements within an array. 

A: 
START: 
- Define method accepting one argument (array of number strings)
- Convert string elements to integers
- Sort integers by descending value. 
- Convert integers back to strings
- Output new array containing strings sorted in descending numeric value. 

C: 

def descending_strings(string_array)
  integer_array = string_array.map { |element| element.to_i } 
  integer_array.sort!.reverse!
  integer_array.map! {|element| element.to_s }
end 

or...

arr.sort do |a, b|
  b.to_i <=> a.to_i 
end 



2. How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]


P: 
Input: array made of of hashes. In this case, each hash is made up of 3 key/value pairs
Output: array of hashes sorted by year of publishing

E: 
output for this case would be:
books = [
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'}
]

D: 
Data structures used in this example are arrays and hashes 

A: 
START
- Iterate through array passing each hash into the block
- Iterate through individual hashes
- Find earliest publishing year among hashes and set to first element in array
- Repeat process until array is sorted with hash listed from earliest to latest publishing year
- Output array 

C: 

books.sort_by do |hash|
  hash[:published].to_i    # since years are all 4 characters long, do not need .to_i here we can compare the strings. 
end 
    
    

3. For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

                     arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

                    arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

                    arr3[2][:third][0].chars.first
                    arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

                    hsh1["b"][1]
                    
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
                    hsh2[:third].keys[0]
                    
                    

4. For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

        arr1[1][1] = 4


arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

        arr2[2] = 4


hsh1 = {first: [1, 2, [3]]}

        hsh1[:first][2][0] = 4



hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

        hsh2[["a"]][:a][2] = 4
        


5. Given this nested hash: find out the total age of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}



total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end 

total_male_age 


6. Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

example: (Name) is a (age)-year-old (male or female).



munsters.each do |k, v|
  puts "#{k} is a #{v['age']}-year-old #{v['gender']}"
end 



7. Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2        # a is initialized and set to 2
b = [5, 8]   # b is initialized and set to a two element array [5, 8]
arr = [a, b] # arr is initialized and set to two element array [a, b]....[2, [5, 8]]  creates nested array

arr[0] += 2    arr[0] = arr[0] + 2  == 4  # here we are assigning new element to index arr[0]
arr[1][0] -= a arr[1][0] = arr[1][0] - a  # b changed bc b is an array and we are modifying the array by assigning a new value at index 0 of that array


final values: 

            a = 2
            b = [3, 8]
            
            
            
8. Using the each method, write some code to output all of the vowels from the strings.


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = "aeiou"

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
      end 
    end 
  end 
 
 
 9. Given this data structure, return a new array of the same structure but with the sub arrays being ordered 
    (alphabetically or numerically as appropriate) in descending order.
    
    arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
    
    
    arr.map do |element|
      element.sort do |a, b|
        b <=> a
      end 
    end 
 
 
 10. Given the following data structure and without modifying the original array, use the map method to return a new array identical in 
     structure to the original but where the value of each integer is incremented by 1.
 
 array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
 
array.map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end 
  incremented_hash
end 
      
      
11. Given the following data structure use a combination of methods, including either the select or reject method, to return a new array 
identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]


arr.map do |element|
  element.select do |num|
    num % 3 == 0 
  end 
end 


12. Given the following data structure, and without using the Array to_h method, write some code that will return a hash 
    where the key is the first item in each sub array and the value is the second item.
    
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


arr.each_with_object({}) do |element, hash| 
  hash[element[0]] = element[1]
end 

or 


hash = {}
arr.each do |item|
  hash[item[0]] = item[1]
end 

# using each_with_object a bit cleaner, as you don't have to initialize a new empty hash.

13. Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by 
    only taking into consideration the odd numbers they contain.
    
    arr = [[1, 6, 9], [1, 4, 9], [1, 6, 7], [1, 8, 3]]
    
    Sorted array should look like: 
    
    [[1, 8, 3], [1, 6, 7], [1, 4, 9], [1, 6, 9]]
    
    
    arr.sort_by do |sub_array| 
      sub_array.select do |odd_num|
        odd_num.odd?
      end 
    end 
  

14. Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables.
    The sizes should be uppercase and the colors should be capitalized.
    
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

The return value should look like this: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh.map do |_, v|
  if v[:type] == "fruit"
    v[:colors].map do |color|
      color.capitalize
    end 
  elsif v[:type] == "vegetable"
    v[:size].upcase
  end
end 


15. Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, value|
    value.all? do |integer|
      integer.even?
    end 
  end 
end 

Since select will return all the elements for which the block returns true and we only want hashes where all the integers are even, all? 
combined with even? is a good choice here. The situation is complicated slightly by the fact that the integers are further nested inside 
the inner arrays, so we need to iterate through these first.

If all of the integers in an inner array are even then the inner block returns true to the innermost call to all?. If all of the inner blocks
for a particular hash return true then the middle block returns true to the outer call to all? which in turn causes the outer block to return
true to the select method for that iteration.
 


16. Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

    It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

    Write a method that returns one UUID when called with no parameters.
    

characters = %w(a..z, 1..9)
def uuid
  d