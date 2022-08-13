1. In hash below, see if "Spot" is present. What are two other hash methods that would work for this solution.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ANSWER: 
      ages.key?("Spot")
      ages.fetch("Spot")
      ages.include?("Spot")
      ages.member?("Spot")
      



2. Convert this string: 
                       munsters_description = "The Munsters are creepy in a good way."
   In the following ways:
                        "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
                        "The munsters are creepy in a good way."
                        "the munsters are creepy in a good way."
                        "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
  
  ANSWER:
         munsters_description.swapcase!   # Swaps uppercase to lowercase and vice-versa
         munsters_description.capitalize! # capitalizes first character in string/lowercase remaining
         munsters_description.downcase!   # makes all characters lowercase
         munsters_description.upcase!     # makes all characters uppercase
         
         
  
  
3. add ages for Marilyn and Spot to the existing hash

    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
    
    additional_ages = { "Marilyn" => 22, "Spot" => 237 }
    

        ANSWER: ages.merge!(additional_ages)
        
        
        

4. See if the name "Dino" appears in the string below:

    advice = "Few things in life are as important as house training your pet dinosaur."
    
    
  ANSWER: 
          advice.include?("Dino")
          




5. Show an easier way to write this array: 

        flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
        
  
        ANSWER: 
        flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
        


6. How can we add "Dino" to array?
  
            flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
            

ANSWER: 
        flintstones << "Dino"
        flintstones.unshift("Dino")
        flintstones.insert(idx, "Dino")
        flintstones.push("Dino")



7. How can we add multiple items to our array? (Dino and Hoppy)

    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    
ANSWER: 
      flintstones.insert(idx, "Dino", "Hoppy")
      flintstones.push("Dino", "Hoppy")
      



8. Shorten the following sentence:

          advice = "Few things in life are as important as house training your pet dinosaur."
  
  
  Use slice method to make return value "Few things in life are as important as" but leave advice variable 
  as "house training your pet dinosaur"
  
  
  ANSWER: 
        advice.slice!(0, advice.index("house"))
        
    Using non-destructive method (slice) would return new string with the deleted portion, but would 
    leave the original string intact. 
    
    
  
    
9. Write a one-liner to count the number of lower-case 't' characters in the following string:

          statement = "The Flintstones Rock!"
          
  
  ANSWER: 
          statement.count("t")
          
          
          
10.  If we had a table of Flintstone family members that was forty characters in width,
      how could we easily center that title above the table with spaces?
      
    title = "Flintstone Family Members"
    
ANSWER: 
        title.center(40)
        
      can also add characters to fill white space if centering object. title.center(40, "**")
      
      