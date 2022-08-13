Question 1: 

Predict how the values and object ids will change throughout the flow of the code: 

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

# * initial identification of object id's. Noticed that the object id for '42' is reused for value assigned to 
#    a_outer and d_outer. They are referencing the same object. 

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

# * Object id's have not changed as a result of the block. 

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

# * After reassignment- object id's have changed. Reassigning variables to new values forces Ruby to create new objects.


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id


    puts
  end

# Once we leave the block- variables defined within the block are unavailable. 


Question 2

    Similar question to one above but uses method instead of block with same info.
    
    Even though we changed the values of outer variables inside the method, the same values /object id's exist as prior to method. 
    
    Method is accepting values as arguments- the names we give to those values in the definition of the method are separate
    from any other use of same variable name. 
    
    The method gets the values of the arguments we pass but the parameter variables inside the method have no other 
    relationship to those outside of the method.
    
    Main method still has no access to variables that are defined inside the method.


Question 3

    Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, 
    the results can be different.
    
    Study the following code and state what will be displayed...and why:
    
    def tricky_method(a_string_param, an_array_param)
      a_string_param += "rutabaga"
      an_array_param << "rutabaga"
    end
    
    my_string = "pumpkins"
    my_array = ["pumpkins"]
    tricky_method(my_string, my_array)
    
    puts "My string looks like this now: #{my_string}"
    puts "My array looks like this now: #{my_array}"

Initial Answer: 
                "My string looks like this now: 'pumpkins'"
                "My array looks like this now: ["pumpkins", "rutabaga"]

In reassignment, the string operation is reassignment- the local variable string_param now points to pumpkinrutabaga while
my_string still points to pumpkins ( this is because reassignment is non-mutating)
The << operator is mutating and operates on the original object that was passed in, and appends new element to it. 



Question 4

    To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.
    
    def tricky_method_two(a_string_param, an_array_param)
      a_string_param << 'rutabaga'
      an_array_param = ['pumpkins', 'rutabaga']
    end
    
    my_string = "pumpkins"
    my_array = ["pumpkins"]
    tricky_method_two(my_string, my_array)
    
    puts "My string looks like this now: #{my_string}"
    puts "My array looks like this now: #{my_array}"

This question is similar to the previous one, however the << operator is now being utilized to append the string, rather than 
add another element to the array. 

*** The important point in this exercise pertains to what Ruby does with local variables when we change the object it points to.
    Does it create a new local variable? Or is it able to modify the existing object. 
    
    In this case, the array assignment created a new object, and we assign it to the local variable an_array_param. 
    
    
Question 5

    Depending on a method to modify its arguments can be tricky:
    
    def tricky_method(a_string_param, an_array_param)
      a_string_param += "rutabaga"
      an_array_param << "rutabaga"
    end
    
    my_string = "pumpkins"
    my_array = ["pumpkins"]
    tricky_method(my_string, my_array)
    
    puts "My string looks like this now: #{my_string}"
    puts "My array looks like this now: #{my_array}"
    
    Whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.
    
    How can we change this code to make the result easier to predict and easier for the next programmer to maintain?
    
    Answer: 
    
        def tricky_method(a_string_param, an_array_param)
          a_string_param += "rutabaga"
          an_array_param += "rutabaga"
          
          return a_string_param, an_array_param  # explicit return, otherwise only returns last line of method
        end 
        
        my_string = "pumpkins"
        my_array = ["pumpkins"]
        my_string, my_array = tricky_method(my_string, my_array)
        
        puts "My string looks like this now #{my_string}"
        puts "My array looks like this now #{my_array}"
        
        
Question 6

How could the following method be simplified without changing its return value?


def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
    


Answer: Ruby automatically evaluates statements- so the following would work well. 

def color_valid(color)
  color == "blue" || color == "green"
end 