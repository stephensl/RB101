# Lesson 4.10 
#   Practice Problems: Methods and More Methods


1. What is the return value of the select method below? Why?


[1, 2, 3].select do |num|
  num > 5
  'hi'
end

Answer: 

The return value of the select method is a new collection containing elements that returned truthy value from the block. 

In this case, select is called on an array containing three integer elements [1, 2, 3]. 

We iterate over the array passing each element into the block with num representing current element value.

The return value of the block on each iteration will be the string "hi"

Since "hi" is a truthy value, each element will be selected and added to the new collection which will be returned from the method. 

Therefore, the return value of the method will be an array containing all three elements => [1. 2. 3]




2. How does count treat the block's return value? How can we find out?"'


['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end


ANSWER: 

Based on the Ruby Documentation:

With a block given, calls the block with each element and returns the number of elements for which the block returns a truthy value.

In this case, each elements is passed to the block, with two of the three returning a truthy value for str.length < 4

So the return value here would be 2. 




3. What is the return value of reject in the following code? Why?


[1, 2, 3].reject do |num|
  puts num
end


ANSWER: 

Return value in this case would be [1, 2, 3]

Reject is essentially the opposite of select in that it selects and returns values from the collection that return falsey from block.

In this case, puts num is the last expression evaluated in the block, and the return value of puts is nil. 

For each element passed into the block, the return value of the block is nil- therefore the element is selected. 




4. What is the return value of each_with_object in the following code? Why?


['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end


ANSWER: 


In this case, each_with_object returns 

{"a" => "ant", "b" => "bear", "c" => "cat"}

When we invoke each_with_object we pass in an object,  ({}) in this case, as an argument. The object is then passed into the block
and its updated value is returned at the end of each iteration. Once it has iterated over the calling collection, it returns the 
initially given object {} which now contains all the updates. 


5. What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift


ANSWER:

Looking at the Ruby Documentation, it states that it will remove the first hash entry and return a two element array [k, v], containing
the removed key and value. 

In this case it would return

[:a, "ant"]




6. What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size


ANSWER:

In this case, we are calling Array.pop on a three element array made up of strings. .size is then called on the return value of .pop. 

So, calling .pop removes and returns the last elements of the array ("carerpillar") and calls .size on that value. 

Calling .size on a string element returns an integer equal to the number of characters in the string. in this case 11. 

Return value would be 11. 



7. What is the block's return value in the following code? 
   How is it determined? 
   Also, what is the return value of any? in this code and what does it output?"'
   
   
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end


The return value of the block would be a boolean (true/false) based on whether current num in iteration is odd. The block return
value is determined by the last evaluated expression of the block. In this case num.odd?

any? returns a boolean based on whether of not any of the elements passed into the block return a truthy value. 

In this case, the return value of any? would be true, as 1 returns true from the block on the first iteration. 
**Iteration is halted after the first because the first element returned true, and true is returned from the method. 



8. How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

ANSWER:

According to RUby documentation, take will return a new array consisting of the first n elements, where n is non-negative integer. 
Take does not modify the original collection. 

In this case, the first two elements of the array will be "taken" and returned in a new array. 

=> [1, 2]

What happens if you pass in an integer argument to take more than the elements in the collection?

It will return array with all elements of the array included in the new array...no error/out of bounds. 

ex. [1, 2, 3].take(10)

=> [1, 2, 3]


9. What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end


ANSWER:

My understanding of map, is that it accepts a block as an argument with two parameters |key, value|. Each key and value is 
passed into the block. The return value is an array containing elements transformed by the block. Ihis case the two values in the hash
are evaluated based on string.size. the first value, "ant" is not greater than 3, value is not returned because the if condition evaluated
false and thus returns nil. "bear" evaluates to true in this case, and value ("bear") is returned. 

We end up with an array [nil, "bear"] containing the return values from the elements that were passed into the block. 

** I did not know the part about nil being returned if an element fails an if condition. This is the same with arrays. 
   I guess i don't use if conditions when i call map very often? flashcard. 


10. What is the return value of the following code? Why?'

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end


ANSWER:

In this case map is callesd on an array made up of three integers. Each integer is passed into the block which contains an if condition. 

Iteration 1: 1 is not greater than one, else num.  1 is returned and is first component of returned array. [1, ]

Iteration 2: 2 is greater than 1. call puts on num, return value of puts is nil. nil is second element. [1, nil, ]

Iteration 3: is the same as two, and returns nil. [1, nil, nil]


=> Return value of method is [1, nil, nil]

* Ruby only concerned with return value of the block. 