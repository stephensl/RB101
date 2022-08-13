# greeting = "Hello"

# loop do 
#   greeting = "Hi"
#   break
# end 

# puts greeting 

# This code demonstrates local variable scoping rules with regard to blocks. 

# On line 8, we call the puts method, and pass in the local variable greeting as an argument. 
# This line will output the string object "Hi" and return nil. 

# On line 1, local variable greeting is initialized and assigned to reference the string object whose value is "Hello"

# Line 3, we call the loop method and pass in the do..end block as an argument. 
# On line 4, greeting is reassigned to the string object "Hi"

# This reassignment is possible because local variable scoping rules allow for local variables, that are initialized in an outer scope, to
# be accessed within the block. 

# **We are interested in output, return value, and mutatations (side-effects) to objects.


