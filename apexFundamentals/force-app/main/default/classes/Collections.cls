public with sharing class Collections {
    public Collections() {
        /*List - an ordered collection of elements of same datatype; can have duplicates;
         new keyword is used to create an instance of a class
        and allocate memory
        */
List<Integer> numbers = new List<Integer> {7676767,5656,777};
System.debug(numbers);

//add element to a List
numbers.add(7);
System.debug(numbers); 

//get an element from a List
numbers.get(1);

//size of a List
System.debug(numbers.size());

//remove 1st element 
numbers.remove(0);

//clear the List
numbers.clear();

// update element on 1nd index
numbers.set(1, 66);


/* SET - an unordered collection of elements of same datatype (doesn't have indexes), doesn't allow duplicate elements
*/

Set<Integer> num = new Set<Integer> {3,5,7};

//add (adding duplicate values - NOT ALLOWED)
num.add(9);

//contains
num.contains(9);

//remove
num.remove(9);

//size
num.size();

//isEmpty
num.isEmpty();


/*
MAP - a (key, value) pair based collection, doesn't take duplicate keys
*/
Map<Integer,String> class2022 = new Map<Integer,String>();

//add a new student/item
class2022.put(0, 'Tom');
class2022.put(1, 'Mike');


//update, override value
class2022.put(1, 'Anna');

// get a value
System.debug(class2022.get(1));

//remove an item from map
class2022.remove(1);

// get all the keys
Set<Integer> keys = class2022.keySet();

//get all the values
List<String> students = class2022.values();

//check if Map has a key
class2022.containsKey(1);


    }
}
