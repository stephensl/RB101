1. Write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

          The Flintstones Rock!
           The Flintstones Rock!
            The Flintstones Rock!


ANSWER: 
        10.times { |number| puts (" " * number) + "The flintstones rock!" }

        My understanding of this code is that it will loop 10 times- iterating over the block 10 times, passing in values
        starting at 0 to 9. (times method passes in values from 0 to int -1)
        
        So, each iteration would look like this within the method:
          First iteration: |0| puts (" " * 0) + "The Flintstones Rock!" (indented 0 spaces)
          Second iteration: |1| puts (" " * 1) + "The Flintstones Rock" (indented 1 space (" " * 1)) etc. 




2. The result of the following statement will be an error:
  
            puts "the value of 40 + 2 is " + (40 + 2)
 
  Why is this and what are two possible ways to fix this?

ANSWER: 

      In this code, we are attempting to concatonate a string and an integer.
      
  We could use string interpolation: puts "the value of 40 + 2 is #{40 + 2}"
  We could also call .to_s on (40+2) 




3. Alan wrote the following method, which was intended to show all of the factors of the input number:

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
            
ANSWER: 

      def factors(number)
        divisor = number
        factors = []
        
        while divisor > 0
          factors << number / divisor if number % divisor == 0 
          divisor -= 1
        end 
        factors
      end 
    
    ** Using this will return empty array [] for 0 or negative input.
    

4.  Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

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

ANSWER: 
      Yes, there is a difference between using << and using + to add element to array. The first method is a destructive method
      meaning the calling element is permanently updated even outside of method scope. Therefore, passing buffer into the method
      again after returning it will be passing in array with values reflected as a result of first run. 
      
      Using + is a non-destructive method, meaning that the original caller is not modified outside of the method. So the input array
      outside of the method is unchanged after the method returns. 
      
      Which one to use in this instance would depend on the intent of the program. Are we continuing on with the same buffer being
      updated throughout the program? If so, we would want it to reflect the new elements being added, with displaced elements removed
      when we pass buffer back into the method. 
      
      If we are simply looking for a return value, without wishing to update the variable in the scope of the larger program, we can
      safely use the + operator to add element within the method. 
      

5. What's wrong with the code?

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

ANSWER: 
       We get an error in this code because limit variable is initialized outside of the scope of the method definition and 
       it is not defined as a method parameter or passed in as an argument. 
       
       In order to fix it we need to add limit as a parameter to the method, then pass it in as a third argument when calling the method. 
       
       It should look like this: 
       
      limit = 15
      
      def fib(first_num, second_num, limit) # Here limit is added as parameter to the method so it can accept it as argument. 
        while first_num + second_num < limit
          sum = first_num + second_num
          first_num = second_num
          second_num = sum
        end
        sum
      end
      
      result = fib(0, 1, 15) # Here the limit is passed into the method as an argument
      puts "result is #{result}"
            



6. What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8


    ANSWER: 34 
    
    In this case answer is passed into the mess_with_it method. In the method, the local variable some_number now points to the 
    same variable as answer..(42). within the method, some_number is reassigned to some_number (42) + 8. The return value of the 
    method (50) is reassigned to new_answer. 
    
    In the last line, we print out answer (which is still 42 and unaffected by reassignment that occured within the method) and subtract 
    8, which leaves us with 34. Reassignment does not alter the value that the answer variable points to outside of the method. 
    
    
7.  Did the family's data get ransacked? Why or why not?

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
    
    
  Answer: Yes, the data will be permanently mutated based on the method. The hash passed into the method was not reassigned within 
  the hash, therefore the alterations that took place within the method were done on the munsters hash itself. The values were 
  mutated within the method were values of the munsters hash. '
  
  
8. 
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
      
  
  ANSWER: "paper"
  
  
  
  9. Consider these two methods: 
  
        def foo(param = "no")
          "yes"
        end
        
        def bar(param = "no")
          param == "no" ? "yes" : "no"
        end
        
  What would be the result of the following method invocation?
  
  bar(foo)
          
      
  
ANSWER: "no"

This is due to the return value of the foo() method which is "yes" because it is the last line in the method. "yes" != "no"
so "no" is returned from the bar() method. 



