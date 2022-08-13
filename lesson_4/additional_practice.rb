# # Additional Practice Problems
# # Lesson 4.11

# 1. Given the array below 

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are keys and the values are positions in the array. 



# ANSWER: 

# My initial thought was to use each_with_object as we are returning a hash from an array. 

# each_with_index more appropriate here. 


# flintsones_hash = {} # empty hash initialized

# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index 
# end 

# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5} 




# Is there a way to do this using each_with_object?

# Using each_with_object...


# flintstones.each_with_object({}) do |element, hash| 
#   hash[element] = flintstones.index(element)
# end 

# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5} 

# Using each_with_object here is a bit simpler as it saves from having to initialize new variable flintstones_hash 




# 2. Add up all of the ages from the Munster family hash: 

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }



# ANSWER: 

# array = []
# ages.each do |k, v|
#   array << v 
# end 

# array.sum # => 6174


# This works, but could be made simpler by initializing a total_age counter, and incrementing it during iteration. 

# total_ages = 0 

# ages.each do |_, age|  # here we use _ as the first parameter: Ruby convention to show we don't plan on using it. 
#   total_ages += age 
# end 

# total_ages



# More simply, we could use the inject method here...

# ages.values.inject(:+)

# => 6174

# or 

# ages.values.sum 

# => 6174



# 3. In the age hash: 

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater. 


# ANSWER:

# ages.select! { |_, age| age < 100 }  # select! returns nil if no changes made (no values removed). 

# or 

# ages.reject! {|_, age| age >= 100}

# or 

# ages.keep_if { |_, age| age < 100 }

# ***   Calls the block for each key-value pair; retains the entry if the block returns a truthy value; 
#       otherwise deletes the entry; returns self.




# 4. Pick out the minimum age from our current Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ANSWER: 

# ages.values.min



# 5. Find the index of the first name that starts with "Be"

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# ANSWER: 

# flintstones.index { |name| name[0, 2] = "Be" }



# 6. Amend this array so that the names are all shortened to just the first three characters:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# ANSWER:

# flintstones.map! { |name| name[0..2] }

# or 

# flintstones.map! { |name| name[0, 3] }



# 7. Create a hash that expresses the frequency with which each letter occurs in this string:

# statement = "The Flintstones Rock"

# example output: 

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }



# ANSWER: 

# statement = "The Flintstones Rock"

# character_array = statement.chars

# character_array.each_with_object({}) do |letter, hash|
#   hash[letter] = character_array.count(letter)
# end 


# 8. What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# ANSWER: 

# Breaking down each iteration. 

# We are given an array of 4 positive integers. We call each on the numbers array. 
# 1. object at index 0, 1 in this case,  is passed into the block under the block parameter number. 
# 2. 1 is printed 
# 3. 1 is removed. array now looks like [2, 3, 4]
# 4. element at index 1,  (3) is passed into the block. Printed to the screen and removed. array now looks like [2, 4]
# 5. this iteration would pass in the element at index 2, but based on our modified array, there is no element at index 2. Iteration completed. 

# output: 
# 1
# 3

# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end


# ANSWER: 

# Breaking down each iteration. 

# 1. Element at index 0:   (1) passed into block, printed.
# 2. Last element removed from array (4). Array now looks like [1, 2, 3]
# 3. Element at index 1: (2) passed into block, printed. 
# 4. Last element of array: (3) removed. Array now looks like [1, 2]
# 5. No element present at index 2. Iteration completed. 

# output: 
# 1
# 2

# !!! In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. 
#     They operate on the original array in real time.
    


# 9. As we have seen previously we can use some built-in string methods to change the case of a string. 
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize. 
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

# words = "the flintstones rock"

# would be: 

# words = "The Flintstones Rock"


# Write your own version of the titleize implementation; 


# ANSWER: 

# def titleize(string)
#   string.split.map {|word| word.capitalize}.join(' ')
# end 


# 10. Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values 
#     describing the age group the family member is in (kid, adult, or senior). 
    
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.


# munsters.each do |name, stats| 
#   case stats["age"]
#     when (0..17)
#       stats["age_group"] = "kid"
#     when (18..64)
#       stats["age_group"] = "adult"
#     when (65..10000)
#       stats["age_group"] = "senior"
#   end 
# end

require "pry"

numbers = [7, 3, 5, 2, 1, 8, 4]

numbers.each do |number|
  counter = 0
  number.times do
    counter += 1
    puts counter
    binding.pry
  end
end