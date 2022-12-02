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
}
}