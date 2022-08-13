Question 1
    What would you expect the code below to print out?
    
    numbers = [1, 2, 2, 3]
    numbers.uniq
    
    puts numbers
    
          INITIAL ANSWER: I expect this code to print out 1
                                                          2
                                                          3
          
          CORRECT ANSWER: 1
                          2
                          2
                          3
    
    This is due to the fact that numbers.uniq did not modify the original numbers object. In order to get my expected
    output, the code should have read puts numbers.uniq.


Question 2
    Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
    
    INITITAL ANSWER: The ! (bang) operator following a method invocation indicates that the method is mutating. 
                    It is also used as "not" and returns the opposite of the truthiness or falsiness of an object. 
                    The ? operator returns a boolean value following method invocation. ? is ternary operator for if..else
    
          # 1.  what is != and where should you use it?:
                This means "not equals"
          # 2.  put ! before something, like !user_name
                This turns object into opposite of boolean equivalent. !true == false
          # 3.  put ! after something, like words.uniq!: 
                Indicates that method likely mutates the caller
          # 4.  put ? before something
                Ternary operator for if/else
          # 5.  put ? after something: 
                Returns boolean
          # 6.  put !! before something, like !!user_name
                Returns boolean equivalent of object. 
      
      Reminder: ! or ? are actually part of method name- not Ruby syntax. You don't know what the method is doing,
                even if it ends in those characters. Depends on method implementations. 


Question 3
    Replace the word "important" with "urgent" in this string:
    
    advice = "Few things in life are as important as house training your pet dinosaur."
    
    ANSWER: advice.gsub!("important", "urgent")
    
    
    Question 4
    The Ruby Array class has several methods for removing items from the array. 
    Two of them have very similar names. Let's see how they differ:
    
    numbers = [1, 2, 3, 4, 5]
    
    numbers.delete_at(1)
    numbers.delete(1)
    
    ANSWER: [1, 3, 4, 5] delete_at() deletes array element at indicated index (1)
            [2, 3, 4, 5] delete deletes specific array element indicated "1"
    
            Notes: Both methods are destructive without using '!' operator. 


Question 5
    Programmatically determine if 42 lies between 10 and 100.
      
    ANSWER: 
    
    numbers = (10..100)
    
    p numbers.include?(42)
    
    numbers.cover?(42) - this is the answer given in the exercise. Deals specifically with testing to see
    if an object is between the beginning and end of the range. include? checks within the range by iterating 
    over each element to see if the object is included. cover? works well with dates, integers. Seems like strings,
    would be better served by include?. 
    
    

Question 6
    Starting with the string:
    
    famous_words = "seven years ago..."
    
    show two different ways to put the expected "Four score and " in front of it.
    
    ANSWER: 
    "Four score and " + famous_words
    "Four score and #{famous_words}"
    famous_words.prepend("Four score and ")
    "Four score and " << famous_words


Question 7
    If we build an array like this:
    
    flintstones = ["Fred", "Wilma"]
    flintstones << ["Barney", "Betty"]
    flintstones << ["BamBam", "Pebbles"]
    
    We will end up with this "nested" array:
    
    ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
    
    Make this into an un-nested array.
    
    ANSWER: 
      flintstones.flatten or flinstones.flatten!
    

Question 8
    Given the hash below
    
    flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
    
    Turn this into an array containing only two elements: Barney's name and Barney's number
    
    Intital answer: 
    
    p flintstones.to_a[2]   # => ["Barney", 2] This works- different than program answer
    
    Listed answer: flinstones.assoc("Barney")
    
    Notes: assoc(obj) method searches through hash comparing obj with key using ==.
            returns key value pair as two element array, or nil if no match found. 