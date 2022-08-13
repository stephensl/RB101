Question 1

    In this hash of people and their age,
    
    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
    
    see if "Spot" is present.
    
    Bonus: What are two other hash methods that would work just as well for this solution?
    
      Initial answer: 
        ages.include?("Spot")
        
        Bonus Answers: ages.key?("Spot")
                       ages.member?("Spot")
        * Could also use ages.has_key?("Spot")
        
        Note: I also tried ages.assoc?("Spot") as a trial to see if it returned nil- meaning the key was 
              not present in the hash. This is not the most appropriate use as this method is meant to 
              return an array including key,value pair. It serves the purpose here by returning nil, but 
              other methods mentioned above probably more suitable for this use case. 


Question 2

    Starting with this string:
    
    munsters_description = "The Munsters are creepy in a good way."
    
    Convert the string in the following ways (code will be executed on original munsters_description above):
                                             
                                                     Initial answers:
    "tHE mUNSTERS ARE CREEPY IN A GOOD WAY." unsure. (tried munsters_description.upcase![0][4].downcase!- error)
    "The munsters are creepy in a good way." => munsters_description.capitalize!
    "the munsters are creepy in a good way." => munsters_description.downcase!
    "THE MUNSTERS ARE CREEPY IN A GOOD WAY." => munsters_description.upcase!
    
      Solution to first string. munsters_description.swapcase!
      
      Notes: swapcase method swaps capitalized characters from uppercase to lowercase and vice versa. 
      Remember: add ! to alter the original string. without !, returns new string with alterations. 


Question 3

    We have most of the Munster family in our age hash:
    
    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
    
      additional_ages = { "Marilyn" => 22, "Spot" => 237 }
    
    add ages for Marilyn and Spot to the existing hash
    
      Initial Answer: 
      
      ages.merge!(additional_ages)
      
      Notes: Could also use ages["Marilyn"] = 22 
                            ages["Spot"] = 237
      Since additional_ages it is an existing hash, best to use merge! method here. 
      

Question 4

    See if the name "Dino" appears in the string below:
    
    advice = "Few things in life are as important as house training your pet dinosaur."
    
      Initial Answer: advice.include?("dino")
      
      Listed answer: advice.match?("dino")


Question 5
   
    Show an easier way to write this array:
    
    flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
    
    
      Initial Answer: flintstones = %w( Fred Barney Wilma Betty BamBam Pebbles)
      
      Notes: using %w allows for omission of "" and , 

Question 6

    How can we add the family pet "Dino" to our usual array:
    
    
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    
      Initial Answer: flinstones << "dino
      
      Other options to use: 
      
      flintstones.push("dino")
      flintstones.insert(6, "dino")
      flintstones.unshift("dino")


Question 7

    In the previous practice problem we added Dino to our array like this:
    
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    
    flintstones << "Dino"
    
    We could have used either Array#concat or Array#push to add Dino to the family.
    
    How can we add multiple items to our array? (Dino and Hoppy)
    
      Initial Answer: flintstones.insert(6, "Dino", "Hoppy")
      
      Listed Solutions: flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
                        flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item
      
                        
Question 8

    Shorten the following sentence:
    
    advice = "Few things in life are as important as house training your pet dinosaur."
    
    Review the String#slice! documentation, and use that method to make the return value 
    "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".
    
    As a bonus, what happens if you use the String#slice method instead?
    
        Intital answer: Unsure. 
        
        Listed Answer: advice.slice(0, advice.index("house"))
        
        Using this deletes and returns string from index 0 (start of string) up to, but not including, the 
        index-indicated word. 
        
        Bonus: The method would return the same portion of the original string, but the advice variable would
        still be pointing to the original string. 
        

Question 9

  Write a one-liner to count the number of lower-case 't' characters in the following string:

  statement = "The Flintstones Rock!"
  
    Initial answer: statement.count("t")
    

Question 10

    Back in the stone age (before CSS) we used spaces to align things on the screen. 
    If we had a table of Flintstone family members that was forty characters in width, 
    how could we easily center that title above the table with spaces?
    
    
    title = "Flintstone Family Members"
    
        Initial answer: unsure
        
        Listed Answer: title.center(40)
        
        Notes: using the center method- input number of characters to center string within that width. 
               can use padstr to place characters in the empty spaces next to string. For example- ***"string"***