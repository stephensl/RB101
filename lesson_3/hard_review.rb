1. What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

ANSWER: 

# # I expect nothing will be output to the screen. greeting is initialized within an if statement which does not create its own scope, 
# # so greeting is accessible when it is referenced in the last line. However, we are not printing anthing to the screen, and since all 
# # ruby objects are truthy except false and nil, we can't be sure that the string "hello world" will be assigned to greeting without 
# # seeing another condition. Since this is the only condition given, can we assume that "if false" will actually be evaluated as 
# # true, and greeting will not be initialized on line 2?

# # Greeting is nil, no exception is thrown. When you initialize a local variable within an if block, even if the if block does not
# # get executed, the local variable is initialized to nil. Return value is nil. 


2. What is the result of the last line in the code below?

greetings = { a: "hi" }
informal_greeting = greetings[:a]
informal_greeting << "there"

puts informal_greeting
puts greetings 

ANSWER: 

  :a => "hi there"

This is beacuse on the second line, informal_greeting is initialized to greetings[:a] so it points to "hi". 
<< is used to append "there" to informal_greeting, which points to the same value as greetings[:a]. So greetings[:a] is 
modified to "hi there". This is reflected in the greetings hash. 

The following code would have thrown an error

greetings = { a: "hi" }
informal_greeting = greetings # we are initializing informal_greeting to greetings which points to a hash. 
informal_greeting << "there"  # we cannot append using << here because it is not a hash method. we are only able to use it in the above
                              # example because we were calling it on a string. 

puts informal_greeting
puts greetings 


3. What will be printed by each of these code groups?

A. 

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end 

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is #{one}"
puts "two is #{two}"
puts "three is #{three}"

  ANSWER: I expect that the variables will have not changed value outside of the method because reassignment is not a 
          destructive operation, and therefore will not change the value of the variables outside of the method. 
          
          I beleive it will output:
          "one is one"
          "two is two"
          "three is three"
          
B. 
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


  ANSWER: I expect the variables outside of the method will not have changed as a result of beign passed into the method. This is 
          reassignment again, and like the previous example, reassignment is non-mutating. In the first example we were reassigning 
          variables to other variables, here we are reassigning to values. It should not make a difference in the behavior of the 
          method in terms of variable value in the outer scope. 
          
          "one is one"
          "two is two"
          "three is three"
          
C. 
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


ANSWER: This one is different in that it utilizes a destructive method gsub! within the method, which will alter values outside the 
        scope of the method as well. 
        
        This will output:
                          "One is two"
                          "Two is three"
                          "Three is one"
                          


4. Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. 
    e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number that determines 
    if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.
    

        def dot_separated_ip_address?(input_string)
          dot_separated_words = input_string.split(".")
          while dot_separated_words.size > 0 do
            word = dot_separated_words.pop
            break unless is_an_ip_number?(word)
          end
          return true
        end

 You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 
    components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)." Fix the code. "



    ANSWER:
    
    Planning:
    
    False condition: what happens if is_an_ip_number? is false?
    Component size: inputs other than 4 components shoudl return invalid. 
    
    Ideas: 
    
    check dot_separated_words size before while loop?
    inlcude if condition to output "invalid ip " message if not an ip address. 
    
    def dot_separated_ip_address?(input_string)
      dot_separated_words = input_string.split(".")
      return false unless dot_separated_words.size == 4
    
      while dot_separated_words.size > 0 do
        word = dot_separated_words.pop
        return false unless is_an_ip_number?(word)
      end
    
      true
    end