Question 1

For this practice problem, write a one-line program that creates the following output 10 times, 
  with the subsequent line indented 1 space to the right:

The Flintstones Rock!
The Flintstones Rock!
  The Flintstones Rock!
  
    Initial Answer: 
                    10.times do 
                      puts "The Flintstones Rock!" + " "
                    end 
                    
    Listed Answer: 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
                    
                    
        My understanding of this code is that it will loop 10 times- iterating over the block 10 times, passing in values
        starting at 0 to 9. (times method passes in values from 0 to int -1)
        
        So, each iteration would look like this within the method:
          First iteration: |0| puts (" " * 0) + "The Flintstones Rock!" (indented 0 spaces)
          Second iteration: |1| puts (" " * 1) + "The Flintstones Rock" (indented 1 space (" " * 1))
          etc. 
        
Question 2

    The result of the following statement will be an error:
    
    puts "the value of 40 + 2 is " + (40 + 2)
    
    Why is this and what are two possible ways to fix this?
    
        Initial answer: This code throws an error because it is attempting to use string concatonation on integer. 
                        The error exists with (40 + 2) as it is not a string. 
                        
                Fix 1. puts "the value of 40 + 2 is #{40 + 2}"
                fix 2. puts "the value of 40 + 2 is " + (40 + 2).to_s
                
              *In order to fix this error- you can use string interpolation, or call .to_s on 40 + 2 to convert to string. 

Question 3

    Alan wrote the following method, which was intended to show all of the factors of the input number:
    
  def factors(number)
    divisor = number
    factors = []
    begin
     factors << number / divisor if number % divisor == 0
      divisor -= 1
    end until divisor == 0
    factors
  end

    Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. 
      How can you make this work without using begin/end/until? 
       Note that we're not looking to find the factors for 0 or negative numbers,
         but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
  
    Answer: 
    
    def factors(number)
      divisor = number
      factors = []
      while divisor > 0 do
        factors << number / divisor if number % divisor == 0
        divisor -= 1
      end 
      factors
    end 
    
    Bonus 1: The purpose of number % divisor == 0 is to test to see if there is a remainder from the division problem. 
             Allows us to see if the result of the division is an integer number. 
             
    Bonus 2: This is the return value of the method. Without explicit "return" in the method, the return value of 
             the method is the last statement executed. Without this line, the code would execute, but return value
             would be nil. 
             
Question 4

    Alyssa was asked to write an implementation of a rolling buffer. 
    Elements are added to the rolling buffer and if the buffer becomes full, 
    then new elements that are added will displace the oldest elements in the buffer.
    
    She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". 
    
    Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

  def rolling_buffer1(buffer, max_buffer_size, new_element)
    buffer << new_element
    buffer.shift if buffer.size > max_buffer_size
    buffer
  end

  def rolling_buffer2(input_array, max_buffer_size, new_element)
    buffer = input_array + [new_element]
    buffer.shift if buffer.size > max_buffer_size
    buffer
  end
  
  Answer: The first method definition uses << which mutates the caller and returns a modified buffer. In the second one
          the method will not alter the caller's input argument.
         
  
Question 5

    Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
    
    A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.
    
    Ben coded up this implementation but complained that as soon as he ran it, he got an error. 
    
    Something about the limit variable. What's wrong with the code?
  
    limit = 15

    def fib(first_num, second_num)
      while first_num + second_num < limit
        sum = first_num + second_num
        first_num = second_num
        second_num = sum
      end
      sum
    end
    
    result = fib(0, 1)
    puts "result is #{result}"
    
    Answer: The error in this code is related to variable scope within methods. Methods have a self-contained scope, and 
            therefore cannot access local variables initialized in the outer scope. In this case, limit is initialized outside
            of the scope of the method and is inaccessible within the method definition. In order to remedy this, limit should 
            be initialized at the method level either by adding it as an additional argument or initializing before loop begins. 
            

Question 6

What is the output of the following code?


    answer = 42
    
    def mess_with_it(some_number)
      some_number += 8
    end
    
    new_answer = mess_with_it(answer)
    
    p answer - 8
    
      
        Answer: 34. 
      
      Answer was not changed by execution of the method- new_answer was assigned the result of the method (50)
      but answer remained 42. 42-8 == 34
      

Question 7
    
      One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

      munsters = {
        "Herman" => { "age" => 32, "gender" => "male" },
        "Lily" => { "age" => 30, "gender" => "female" },
        "Grandpa" => { "age" => 402, "gender" => "male" },
        "Eddie" => { "age" => 10, "gender" => "male" },
        "Marilyn" => { "age" => 23, "gender" => "female"}
      }

      def mess_with_demographics(demo_hash)
        demo_hash.values.each do |family_member|
          family_member["age"] += 42
          family_member["gender"] = "other"
        end
      end
      
      After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
      
      mess_with_demographics(munsters)
      
      Did the family's data get ransacked? Why or why not?

  Initial Answer: Yes, this method uses indexed assignment, which mutates the caller. These alterations were made to the 
  original data, rather than a copy of it, which could have been done by reassigning demo_hash to another variable in order
  to save the original data from being mutated. 
  
  
  
  Question 8

    Method calls can take expressions as arguments. 
    Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game,
    but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.
    
    Copy Code
    def rps(fist1, fist2)
      if fist1 == "rock"
        (fist2 == "paper") ? "paper" : "rock"
      elsif fist1 == "paper"
        (fist2 == "scissors") ? "scissors" : "paper"
      else
        (fist2 == "rock") ? "rock" : "scissors"
      end
    end
    
    What is the result of the following call?
    
    puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
    
   
   
       Initial answer: Result will be "paper". 
       
  
  Consider these two simple methods:


Question 9


    def foo(param = "no")
      "yes"
    end
    
    def bar(param = "no")
      param == "no" ? "yes" : "no"
    end
    What would be the return value of the following method invocation?
    
    
    bar(foo)
    

    Initial Answer: This would return "no" because the return value of the foo method will be "yes" because it is the last
    line in the method. When this is passed into the bar method- default param is replaced by return value of foo method ('yes')
    which would evaluate to false- returning "no" from the bar method. 