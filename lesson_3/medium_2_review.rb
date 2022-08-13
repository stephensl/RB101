1. Track object ids through program. 

def fun_with_ids            # Method definition. new scope created. 
  a_outer = 42              # a_outer is initialized and points to integer 42           
  b_outer = "forty two"     # b_outer is initialized and points to string "forty two"
  c_outer = [42]            # c_outer is initialized and points to a single element array containing int. 42
  d_outer = c_outer[0]      # d_outer is initialized and points to element at zero index in c_outer. 42

  a_outer_id = a_outer.object_id      # a_outer_id initialized and set to obj id of a_outer
  b_outer_id = b_outer.object_id      # b_outer_id initialized and set to obj id of b_outer
  c_outer_id = c_outer.object_id      # c_outer_id initialized and set to obj id of c_outer
  d_outer_id = d_outer.object_id      # d_outer_id initialized and set to obj id of d_outer

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # a_outer is 42 with an id of: 85 before the block.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." # b_outer is forty two with an id of: 19505500 before the block.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." # c_outer is [42] with an id of: 19505480 before the block.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." # d_outer is 42 with an id of: 85 before the block.
  puts
  
  1.times do  # begin block within method definition. new scope, but can access variables initialized outside of it. 
    a_outer_inner_id = a_outer.object_id  # a_outer_inner_id initialized in block and set to a_outer_id (85)
    b_outer_inner_id = b_outer.object_id  # b_outer_inner_id initialized in block and set to b_outer_id (19505500)
    c_outer_inner_id = c_outer.object_id  # c_outer_inner_id initialized in block adn set to c_outer_id (19505480)
    d_outer_inner_id = d_outer.object_id  # d_outer_inner_id initialized in block and set to d_outer_id (85)

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." # 85 before & after
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." # 19505500 before & after
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." # 19505480 before & after
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." # 85 before & after
    puts

    a_outer = 22              # a_outer reassigned within block to 22. (new obj id)
    b_outer = "thirty three"  # b_outer reassigned within block to "thirty three" (new obj id)
    c_outer = [44]            # c_outer reassigned within block to [44]. (new obj id)
    d_outer = c_outer[0]      # d_outer reassigned within block to c_outer[0].. (44) (new obj id)

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." # new obj_id
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." # new obj_id
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." # new obj_id
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." # new obj_id
    puts
          #reassignment issued new object_ids

    a_inner = a_outer # a_inner initialized within block and set to a_outer (22)
    b_inner = b_outer # b_inner initialized within block and set to b_outer ("thirty three")
    c_inner = c_outer # c_inner initialized within block and set to c_outer ([44])
    d_inner = c_inner[0] #d_inner initialized within block and set to c_inner[0] (44)

    a_inner_id = a_inner.object_id # a_inner_id initialized and set to obj id of a_inner
    b_inner_id = b_inner.object_id # b_inner _id initialized and set to obj id of b_inner
    c_inner_id = c_inner.object_id # c_inner _id initialized and set to obj id of c_inner
    d_inner_id = d_inner.object_id # d_inner _id initialized and set to obj id of d_inner

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." 
          # a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." 
          # b_inner is thirty three with an id of: 14412960 inside the block (compared to 14412960 for outer).
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
          # c_inner is [44] with an id of: 14412940 inside the block (compared to 14412940 for outer).
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." 
          # d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  # a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  # b_outer is thirty three with an id of: 6300380 BEFORE and: 6340540 AFTER the block.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  # c_outer is [44] with an id of: 6300360 BEFORE and: 6340520 AFTER the block.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  # d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
# Variables initialized inside block unavailable outside the block.
end




2. Same code within method call instead of block: 

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # Same as previous example
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts
  
# a_outer is 42 with an id of: 85 before the block.
# b_outer is forty two with an id of: 2152753560 before the block.
# c_outer is [42] with an id of: 2152753540 before the block.
# d_outer is 42 with an id of: 85 before the block.

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end

    
    # Even though we changed the values of outer variables inside the method, the same values /object id's exist as prior to method. 
    
    # Method is accepting values as arguments- the names we give to those values in the definition of the method are separate
    # from any other use of same variable name. 
    
    # The method gets the values of the arguments we pass but the parameter variables inside the method have no other 
    # relationship to those outside of the method.
    
    # Main method still has no access to variables that are defined inside the method.
    

3. Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


ANSWER: 

# "My string looks like this now : "pumpkins"
# "My array looks like thid now ['pumpkins', 'rutabaga']"

# The reason this is the result has to do with what occurs within the method. 
# For the string, it is reassignment. a_string_param is reassigned to "rutabaga" and is no longer pointing to the same
# object as my_string, which still points to "pumpkins". The reassignment is not mutating and therefore does not change the 
# value of my_string. 
# The array is appended using << which adds an element to an existing array and is a mutating method. Therefore, the array that
# "rutabaga" is being added to, is the same array that was passed in and is pointed to by an_array_param. Because this method is 
# destructive, the array reflects the newly added element outside of the method in my_array. 


4. What will output be?

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


ANSWER: 

#   "My string looks like this now pumpkinsrutabaga"
#   "My array looks like this now ['pumpkins']" 
  
# The reason for this output is that now the string used the << operator, which mutates the original string. The array is 
# reassigned within the method so my_array and the parameter an_array_param are no longer pointing to the same array. 


5. How can we change this code to make the result easier to predict and easier for the next programmer to maintain?

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

ANSWER:

# I would change the name of the method to reflect what it is intending to accomplish. If we wish to mutate the original object
# and have it reflected in the outer scope, we could use the << operator for both the string and the array. If we simply want to 
# return a new string/array object reflecting the added string/element, we can use assignment for both and return them from the method
# as new objects. 

# # ...
# a_string_param += "rutabaga"
# an_array_param += ["rutabaga"]

# return, a_string_param, an_array_param
# end

6. How could the following method be simplified without changing its return value?


def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end


ANSWER: 

def color_valid?(color)
  color == "blue" || color == "green"
end 

The above method will automatically return true or false. 