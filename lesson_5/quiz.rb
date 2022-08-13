1. Given the code below:

arr = ['340', '15', '1', '3400']

arr.sort # => ['1', '15', '340', '3400']


Which of the following statements most accurately describes why that particular return value is produced?

- Here we are given an array..4 elements, number strings. 
- Array#sort is called on arr. 
- Return value is a 4 element array, containing number strings. 

The reason for the return value, is when we call Array#sort on this collection, strings are compared on a character-by-character basis. 
So, the method first looks at the first character of each string "1", "1", "3", "3"
Then we move to the next character.. because '15' is longer than "1" it is sorted after "1". 
For the next two elements, which are already sorted after "1" and "15" we look at the third and then fourth character of the string since 
the first three characters are identical.."340" we move to the next.. because "3400" is longer than "340" it is considered greater than, and 
sorted last. 

The Array#sort method sorts items by using comparison. The comparison is carried out using the appropriate comparison method for the item type, in this case the String#<=> method. The String#<=> calls String#ord for every character in the string, with the total of the resulting Integer ordinals determining the sort order.

The Array#sort method sorts items by using comparison. The comparison is carried out using the appropriate comparison method for the item type, in this case the String#<=> method. The String#<=> method compares the strings according to their length.

The Array#sort method sorts items by using comparison. When comparing strings that represent integers the String#to_i method is automatically called and the items are sorted according to their numeric value.

***The Array#sort method sorts items by using comparison. The comparison is carried out using the appropriate comparison method for the item type, in this case the String#<=> method. The strings are compared character by character according to ASCII position. Longer strings are considered greater if the strings are equal when compared up to the shortest length.



2. In the following array, a, b, c and d are variables representing objects to be sorted:

    [a, b, c, d]

Given the following return values when we compare these variables:

a <=> b => -1       # a < b
c <=> b => 0        # c == b
d <=> c => 1        # d > c

According to return values above, a is less than b. c is equal to b, so a is also less than c. d is greater than c, so it is also
greater than b (which is equal to c) and a (which is less than c and b).

I would expect the order not to change. My answer [a, b, c, d]



3. Given the code below, select all the valid ways to return the value for the hash key :three.

arr = [
  {one: '1', two: 2},
  [{four: 5, three: 6}, :three],
  :three,
  {2=>:two, 3=>:three}
]


There is only one hash-key :three in this array.

arr is made up of hashes, sub-arrays-with hashes as elements, symbols as elements of a sub array, symbols as array elements, hash with symbols
as values. 

The hash-key :three is located in a sub-array at index 1 of arr..a hash, with two key/value pairs is the first element of this sub-array. 

So in order to access the hash-key :three. we must access the sub-array that the hash is nested in. This is done by using element reference
arr[1] # subarray containing hash, which contains specified key. [{four: 5, three: 6}, :three]
Then we will reference the first element (index 0) of the sub-array to access the hash.. arr[1][0] # {four: 5, three: 6} 
From here, we can access the particular value by calling hash#values[1].. calling hash.values returns an array containing values.. in this case
it would return a two element array containing the two values present in the hash.. 6 is the value at index 1 of the array. 

=>  arr[1][0].values[1] or arr[1][0][:three]



4. Given the following nested data structure, and without running the code, select the correct option to change the string 
    'Apple Juice' to 'Orange Juice'.

todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  }
]


First, lets break down the data structure. 

- variable name = todo_lists
- array 
    -contains a hash with 3 key value pairs, the third key has values that are an array of hashes with three k/v pairs.
    
Possible re-write of structure to make it more intuitively readable. 

todo_lists = [ { id: 1, list_name: "Groceries", todos: [ { id: 1, name: "Bread", completed: false }, 
                                                         { id: 2, name: "Milk", completed: false }, 
                                                         { id: 3, name: "Apple Juice", completed: false } ] ] } ]
                                               
        
To access the string "Apple Juice"...

todo_lists[0] # references the outer hash containing the three keys..including the key :todos, which houses the values array where
our targeted string is housed in a sub-hash as a value. 

todo_lists[0][:todos]... gives us access to sub-array containing three hashes. The targeted hash is at index 2 of the sub-array
so next we do..

todo_lists[0][:todos][2].. this gives us access to the hash { id: 3, name: "Apple Juice", completed: false }

Now, we need to reference the key containing our targeted value string or the values themselves. we can do the following...

todo_lists[0][:todos][2].values[1] .. this would allow us to access "Apple Juice"   alternatively, we could access through its key..
todo_lists[0][:todos][2][:name]

Once we can access the string, we perform reassignment. 

todo_lists[0][:todos][2][:name] = "Orange Juice"



5. Given the following nested data structure, and without running the code, select all the options that would set the value
   for :completed to true for all of the todos in the 'Homework' list.
       
       
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]


Seems like we will need some iteration happening here. 
to access the hashes containing the elements we want to update...

todo_lists[1]... todo_lists is an array containing two elements (two hashes) we want to access the hash at index 1. 

So now we are working with { id: 2, list_name: "homework", todos: [ { id: 1, name: "Math", completed: false}, { id: 2, name: "English", completed: false } ] }

We then need to reference the values of the key :todos so we use ... todo_lists[1][:todos] and will be working with the sub array containing 2 hashes..

[ { id: 1, name: "Math", completed: false}, { id: 2, name: "Enlgish", completed: false } ]

So, if we want to change the values of the :completed key in each of the two hashes.. we can think about iterative ways to do this.

todo_lists[1][:todos].each do |hash|
    hash[:completed] = true
end 



6. Without running the code attempt to work out what the last three lines will output.

a = "hi"                                                                # a is initialized and set to reference the string "hi"
english_greetings = ["hello", a, "good morning"]                        # english_greetings initialized and set to reference a three element array containing a string, 
                                                                            # the variable a (which points to the string "hi") and another string. 
                                                                        
greetings = {                                                           # greetings initialized and set to reference hash containing three key value pairs.
    french: ["bonjour", "salut", "allo"]                                    # two of the values are arrays containing three string elements, and one of the values
    english: english_greetings,                                                 # is the variable english_greetings which references a three element array initialized
    italian: ["buongiorno", "buonasera", "ciao"]                                    # on line 2. 
}

greetings[:english][1] = "hey"                                          # element reference/re-assignment.. reference the element at index 1 of english_greetings array
                                                                         # which is a, which points to the string "hi". Here we are re-assigning it to the string "hey"
                                                                         # so the array is now english_greetings = ["hello", "hey", "good morning"]
                                                                         
greetings.each do |language, greeting_list|
    greeting_list.each { |greeting| greeting.upcase! }
end 

puts a                                              # "hi"
puts english_greetings[1]                           # "HEY"
puts greetings[:english][1]                         # "HEY"



7. Identify the matching description from the following code

[["a", "b"], ["c", "d"], ["e", "f"]].map do |sub_arr|
    sub_arr.map do |letter|
        letter.upcase
    end 
end 

=> will return new array with values transformed as a result of the block. [["A", "B"], ["C", "D"], ["E", "F"]]



8. Your team is working on some reporting functionality for the Sales Department. Your brief is to produce code that lets the Sales Department report on the value of orders 
    per customer. Each order is represented by a hash within an array, but there may be more than one order per customer. The Sales Department wants to report two things:

The total value of orders for each customer
The total value of fulfilled orders for each customer

This is an example of the provided data:

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

Your team decides to approach the problem in two stages:

Convert the initial data structure to a more usable format
Extract the required information from the restructured data


customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]


order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]
Possible solutions..line by line


  
  customer_orders = {}                                                      # customer_orders initialized as empty hash to push data to. 
  
  order_data.each do |row|                                                  # array#each is called on the order_data array..each element passed into block assigned to local var |row|
    if customer_orders.key?(row[:customer_id])                              # conditional statement..checking to see if customer_orders contains key row[:customer_id]
      customer_orders[row[:customer_id]][:orders] << [                      # appending customer_orders hash..creating :orders key within customer_id 
        row[:order_fulfilled],                                              # appending customer_orders hash with :order_fulfilled key
        row[:order_value]
      ]
    else
      customer_orders[row[:customer_id]] = {                                # creates :customer_id key sets to hash containing three other keys, and their values. 
        customer_id: row[:customer_id], 
        customer_name: row[:customer_name],
        orders: [
          [
            row[:order_fulfilled], 
            row[:order_value]
            ]
          ]
        }
        
      end 
    end 
    
    customer_orders = customer_orders.values 
    
    End up missing keys to represent order_fulfilled and order_value
    
    
   
    temp_orders = {}
    
    order_data.each do |row|
      temp_orders[row[:customer_id]] = {
        customer_name: row[:customer_name], 
        customer_id: row[:customer_id], 
        orders: [
          {
            order_fulfilled: row[:order_fulfilled], 
            order_value: row[:order_value]
          }
        ]
      }
      
    end 
    
    customer_orders = temp_orders.values 
    
    Each iteration, information gets updated/replaced, not added to. 
    
    

  customer_orders = {}
  
  order_data.each do |row|
    if customer_orders.key?(row[:customer_id])
      customer_orders[row[:customer_id]][:orders] << {
        order_fulfilled: row[:order_fulfilled], 
        order_value: row[:order_value]
      }
    else
      customer_orders[row[:customer_id]] = {
        customer_id: row[:customer_id], 
        customer_name: row[:customer_name], 
        orders: [
          {
            order_fulfilled: row[:order_fulfilled], 
            order_value: row[:order_value]
          }
        ]
      }
    end 
    binding.pry
  end 
  
  customer_orders = customer_orders.values      
  
  this one works
  
  
require "pry"  
customer_orders = order_data.map do |row|
  {
    customer_id: row[:customer_id],
    customer_name: row[:customer_name], 
    orders: [
      {
        order_fulfilled: row[:order_fulfilled], 
        order_value: row[:order_value]
      }
    ]
  }
  binding.pry
end 
  
unsure..using pry i kept getting nil values...




customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]



9. For the second part of the solution, extracting the data, the format that is required in each case is as follows:

all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]

  

all_orders = customer_orders.map do |customer|                         # iterate through array elements..hashes
  {
    customer_id: customer[:customer_id], 
    customer_name: customer[:customer_name]
  }
end 

# so the return value here is the hash?? so at this point does all_orders look like this?

all_orders = [{:customer_id=>12, :customer_name=>"Emma Lopez"}, {:customer_id=>32, :customer_name=>"Michael Richards"}]


customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0)
