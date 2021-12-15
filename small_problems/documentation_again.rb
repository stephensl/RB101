# RB 101-109 Small Problems 
# Documentation Again

1. Locate the ruby documentation for methods File::path and File#path. 

   How are they different?
   
   
   => File::path is a class method and returns a string representation of the path. 
   => File#path is an instance method and returns pathname used to create file 
   
   => Class methods are called on the class, while instance methods are called on objects of the class. 
      
  

2. What will each of the 4 puts statements print?


require 'date'

puts Date.civil                 => -4712-1-1
puts Date.civil(2016)           => 2016-01-01 
puts Date.civil(2016, 5)        => 2016-05-01 
puts Date.civil(2016, 5, 13)    => 2016-05-13 

The documentation for Date::civil (note that it is a class method) shows that its signature is:

civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date

This signature uses [] to show that all of the arguments are optional. 
This is only a documentation convention; the brackets should not be included in your program.

Date.civil                             # everything defaults
Date.civil(2016)                       # month, mday, start use defaults
Date.civil(2016, 5)                    # mday, start use defaults
Date.civil(2016, 5, 13)                # start uses default
Date.civil(1751, 5, 13, Date::ENGLAND) # nothing defaults


3. Use the ruby documentation to determine what this code will print.

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)


      Based on default positional arguments the code will print 
      
      [4, 5, 3, 6]
      
      4 is assigned to a, and 6 is assigned to d. this leaves two default arguments and one argument remaining that was passed in. 
      since b is the first default remaining (reading left to right) it is assigned 5. c keeps its default value. 
      
      https://ruby-doc.org/core-2.6.3/doc/syntax/calling_methods_rdoc.html




4. The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]

    How would you search this Array to find the first element whose value exceeds 8?

    
    
    a.bsearch {|x| x > 8}

        => 11

bsearch takes one argument (a block which must return either true or false) and returns an element of the array to which it is applied. 


5. What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7)                             => IndexError - index lies outside of array bounds
puts a.fetch(7, 'beats me')                 => "beats me" - index outside of bounds but supplied default value. 
puts a.fetch(7) { |index| index**2 }        => 49. Index out of bounds so block executed. 


#fetch simply returns the element of an Array by its index, but it also does bounds checking (which Array#[] does not); 
# that is, it checks whether the specified element actually exists before fetching it, and raises an error if doesn't exist


6. What does this code print?

        5.step(to: 10, by: 3) { |value| puts value }



ANSWER: 

5 
8

Steps from calling integer, to limit, by integer- defaults to 1 if none given. 





7. Use irb to run the following code:

s = 'abc'
puts s.public_methods.inspect

This prints a list of all the public methods available to the String s. 
    Includes methods from String class and methods inherited from Object- which inherits methods from BasicObject and Kernel module. 
    
    
How can we only print the public methods that are defined or overrridden by the String class. 



ANSWER: 

    s = 'abc'
    puts s.public_methods(false).inspect
    
    
        Every value in Ruby is an object, which means that it has an associated class, and that class in turn has a superclass, or parent. 
        Every class that inherits from a superclass also inherits all of its methods.

        public_methods(all=true) → array
        
        Returns the list of public methods accessible to obj. 
        If the all parameter is set to false, only those methods in the receiver will be listed.
        
        #public_methods takes an optional argument all. If that value is true or omitted, 
        it returns a list of all public methods available to the object (our s String in this case); if all is false, 
        #public_methods limits the output to just those methods in the object that called #public_methods; 
        for our purposes, this means just the methods defined directly in the String class.
            
    ** First look at class documentation then superclass bc superclass methods can be overridden by the subclass. 
    
    

8. Use irb to run the following code:

        a = [5, 9, 3, 11]
        puts a.min

Find the documentation for the #min method and change the above code to print the two smallest values in the Array.


ANSWER: 

Found documentation in Enumerable Module from array class. 

puts a.min(2)       =>
                        3
                        5
                        


9. Find the documentation for YAML::load_file.

Used this way in previous assignments

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')



ANSWER: 
    
        https://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html
        
        The key here is the reference to Psych. 
        If you go back to the Standard Library API page and click on psych, you see a long list of Psych-related classes
        
        This page also lists all of the methods in the different classes, and up near the top of this list is ::load_file, 
        which is part of the Psych module.