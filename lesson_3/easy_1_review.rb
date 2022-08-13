1. What would you expect the following code to print out?

  numbers = [1, 2, 2, 3]
  numbers.uniq
  
  puts numbers

    ANSWER: 
            1
            2
            2
            3
    Calling uniq on numbers array would returns an array containing only unique elements. However, 
    uniq is not a destructive method- therefore the original array: numbers is unchanged. When calling
    puts on numbers the array will be displayed with each element printed on separate line. In order to print
    the array in [1, 2, 2, 3] format, you would need to call print or p instead of puts. 



2. Describe the difference between ! and ? in Ruby. And explain what happens in these scenarios:


1. what is != and where should you use it?
    != signifies "not equal to" and can be used in conditional expressions such as:
    if x != y
      puts "x is not equal to y"

2. put ! before something, like !user_name
    Using the ! operator before an object would evaluate to the opposite boolean value of that object. So 
    for something like !user_name, this would evaluate to false, because we can assume that user_name is a
    truthy object. 

3. put ! after something, like words.uniq!
    The ! operator is often used to signify methods that mutate the caller. Not all destructive methods end in
    ! but it can be a helpful sign that the method is likely destructive. 

4. put ? before something **unsure about this one..**
    Depends on how it is used? Often used as ternary operator.. condition ? true : false

5. put ? after something
    A ? operator after something often indicates that the return value will be a boolean object. For example odd?
    evaluates whether or not the calling object is odd and returns either true or false. 

6. put !! before something, like !!user_name
    Using !! can be interpreted as "not, not" and would return a boolean indicating whether an object is truthy
    or falsey. So !!true could be thought of as "not, not true." which would indicate that it is true. So using it 
    with something like !!user_name would return true, becasue user_name we assume is truthy as all objects are in 
    ruby aside from nil, and false. 

    ANSWER: In ruby the ! or bang operator is used essentially as "not". So placing the ! operator indicates the 
    opposite value in some cases. For example !true would evaluate to false. != would evaluate to "not equal". It 
    can also indicate that a method is destructive, but not all destructive methods end in !. The ? operator is 
    often used following a method that returns a boolean. For example key?() checks to see if a key is present in 
    the calling hash and returns either true or false. The ? operator is also used in ternary expressions such as 
    condition ? true : false 


3. Replace the word "important" with "urgent" in this string: 

    advice = "Few things in life are as important as house training your pet dinosaur."
    
 
    ANSWER:  advice.gsub!("important", "urgent")
 
    *Could use .gsub or .gsub! here depending on if you would like to mutate the string permanently or not. 




4. What do the following method calls do (assume we reset numbers to the original array between method calls)?
  
    numbers = [1, 2, 3, 4, 5]
    
  ANSWER:
    
      numbers.delete_at(1)
        
        This method will delete the element at index 1 of the array, in this case would be 2. It will return the deleted element
        leaving the modified array as numbers = [1, 3, 4, 5]
      
      numbers.delete(1)
        
        This method will delete all occurances of the value passed in as an argument to the delete() method. 
        In this case it will delete the integer 1 element from the array and return the deleted value. the modified array will be 
        numbers = [2, 3, 4, 5]
        
        * Both of these methods are destructive. 
        
        


5. Programmatically determine if 42 lies between 10 and 100. 

    ANSWER:
    
      42.between?(10, 100) or (10..100).include?(42) or (10..100).cover?(42)
      
      .include? and .cover? are in the range class. .cover? returns true when the given range is 
      covered by the receiver by comparing beginning and end values. 
      

6. Show two different ways to put the expected "Four score and " in front of this string..

    famous_words = "seven years ago..."
    
      ANSWER: 
            famous_words.prepend("Four score and ")
            "Four score and " + famous_words
            "Four score and " << famous_words


7. Building an array like this: 
                              flintstones = ["Fred", "Wilma"]
                              flintstones << ["Barney", "Betty"]
                              flintstones << ["BamBam", "Pebbles"]
  Creates a nested array: 
                          ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
  
  Make this into an un-nested array. 
  
  
  
ANSWER: 
      
      flintstones.flatten (non-destructive) or flintstones.flatten! (destructive)
      

8. Given the hash below.. turn into an array containing only two elements: Barney's name and Barney's number.

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }


    ANSWER: 
          flintstones = flintstones.to_a[2]  or  flintstones.assoc("Barney")