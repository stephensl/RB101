Question 1

What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

I expect this code to output nothing. I imagine the value will be nil? I think this because "greeting" was initialized in an
if statement, and is accessible in the current scope. Objects in ruby are truthy (except nil, false) and greeting would evaluate
to true. Therefore, greeting will not output "hello world" as a result of the if statement, and will return nothing. 

Answer: greeting is nil- no error thrown. When you initialize a variable within an if block, even if that  if block does not 
get executed, the local variable is initialized to nil. 


Question 2

    What is the result of the last line in the code below?
    
    greetings = { a: 'hi' }                # greetings is initialized to reference hash containing one k/v pair. 
    informal_greeting = greetings[:a]      # informal_greeting is assigned to the greetings[:a] whose value is 'hi' so now informal_greeting and greetings[:a'] reference the same object
    informal_greeting << ' there'          # informal greeting (which references greetings[:a] object "hi") is appended by mutating method. 
                                              # now informal_greeting and greetings[:a] both reference string "hi there"
    
    puts informal_greeting  #  => "hi there"
    puts greetings
    
    Answer: puts greetings will output hash {:a => "hi there"} as greetings[:a] was mutated by the << method. 
    
    Could use string concatenation if we wanted to operate informal_greeting as it would return a new string object. 
    

Question 3

In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

  A)

    def mess_with_vars(one, two, three)
      one = two
      two = three
      three = one
    end
    
    one = "one"
    two = "two"
    three = "three"
    
    mess_with_vars(one, two, three)
    
    puts "one is: #{one}"
    puts "two is: #{two}"
    puts "three is: #{three}"
    
      Output: This will output: 
                                "one is one"
                                "two is two"
                                "three is three"
      
      Within the method, reassignment is taking place, which does not mutate the original objects. Therefore the variables outside of the 
      method scope are not altered. 
      
      
  B) 
      def mess_with_vars(one, two, three)
      one = "two"
      two = "three"
      three = "one"
    end
    
    one = "one"
    two = "two"
    three = "three"
    
    mess_with_vars(one, two, three)
    
    puts "one is: #{one}"
    puts "two is: #{two}"
    puts "three is: #{three}"
    
    Output: this output would be the same as previous example. The method has a self-contained scope and is performing 
    assignment as an operation within the method- this does not mutate the original objects. 
    
  
  C)
      def mess_with_vars(one, two, three)
      one.gsub!("one","two")
      two.gsub!("two","three")
      three.gsub!("three","one")
    end
    
    one = "one"
    two = "two"
    three = "three"
    
    mess_with_vars(one, two, three)
    
    puts "one is: #{one}"
    puts "two is: #{two}"
    puts "three is: #{three}"
    
    Output: 
            "one is two"
            "two is three"
            "three is one"
            
    This output results from using a destructive method gsub! within the method definition. calling gsub! operates on the 
    original object and is reflected in the variable in the outer scope. 
    
Question 4

    Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.
    
    
    def dot_separated_ip_address?(input_string)
      dot_separated_words = input_string.split(".")
      while dot_separated_words.size > 0 do
        word = dot_separated_words.pop
        break unless is_an_ip_number?(word)
      end
      return true
    end
    
    Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. 
      You're not returning a false condition, and you're not handling the case that there are more or 
        fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
    
    Help Ben fix his code.  
    
  Answer:
        def dot_separated_ip_address?(input_string)
          dot_separated_words = input_string.split(".")
          return false unless dot_separated_words_size == 4
        end 