public with sharing class LoopsInApex {
    public LoopsInApex() {
// Do while loop (executes at-least-once)

Integer year = 2022;

do{
    if(Math.mod(year, 4) == 0  && Math.mod(year, 100) == 0 && Math.mod(year,400) == 0){
        System.debug(year + ' is a leap year');
    }else{
        System.debug(year + ' not a leap year');
    }
    year++;

} while(year <= 3000);

//FIZZBUZZ challenge
Integer number = 0;

do{
    if(Math.mod(number, 3) == 0 && Math.mod(number, 5) == 0){
        System.debug('Fizzbuzz');
    }else if(Math.mod(number, 3) == 0){
        System.debug('Fizz');
    }else if(Math.mod(number, 5) == 0){
        System.debug('Buzz');
    }
    number++;
    
} while(number <= 100);


//WHILE Loops

while(year <= 3000)
{
    if(Math.mod(number, 3) == 0 && Math.mod(number, 5) == 0){
        System.debug('Fizzbuzz');
    }else if(Math.mod(number, 3) == 0){
        System.debug('Fizz');
    }else if(Math.mod(number, 5) == 0){
        System.debug('Buzz');

}
year++;
    }

    //WHILE Loop challenge - FIBONACCI series

    //print first 20 fibonacci numbers 0,1,1,2,3,5,8

//current = previous + beforePrevious
    Intger current;
    Integer previous = 1;
    Integer beforePrevious = 0;
    Integer count = 0;

    System.debug(beforePrevious);
    System.debug(previous);

    while(i < 18 ){


        //calculate current number
        current = beforePrevious + previous;

        //print current value
        System.debug(current);

        //update beforePrevious with previous
        beforePrevious = previous;

        //update previous with current
        previous = current;

        i++;

       
    }


    // FOR LOOP

    for (Integer year = 2022; year <= 3000; year++) {
        if(Math.mod(year, 4) == 0  && Math.mod(year, 100) == 0 && Math.mod(year,400) == 0){
            System.debug(year + ' is a leap year');
        }else{
            System.debug(year + ' not a leap year');
        }

        
    }

    /*FOR loop challenge  - The Patter challenge
    *
    **
    ***
    ****
    *****
    */

    Integer n = 5;

    for(Integer row = 0; row < n; row++){
        String pattern ='';
        for(Integer column = 0; column <= row; column++){
            pattern += '* ';
        }
        System.debug(pattern);
    }

    //break statement - come out of the loop instantly


// continue statement - skips the current iteration of a loop

List<String> days = new List<String>{'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'};

for(Integer i = 0; i < days.size(); i++){
    if(days.get(i) == 'Sunday'){
        continue;
    }
    System.debug('Go to work, it is ' +days.get(i) );

}

//for each loop (List/Set Iteration for loop)

List<Integer> numbers = new List<Integer> {1,2,3,4,5,6,7,8,9};

for (Integer number : numbers) {
    System.debug('Student # ' + number);
    
}




}
}