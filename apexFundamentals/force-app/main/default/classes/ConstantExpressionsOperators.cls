public with sharing class ConstantExpressionsOperators {
    public ConstantExpressionsOperators() {

        //Constant Variable - once initialized, doesn't it's value

        final Integer PI = 3.14159;

        // DateTime.newInstance(2022,11,30,12,09,0) > Expression (gives us value, can be empty)
        //= assignment Operator
        
DateTime currentDateTime = DateTime.newInstance(2022,11,30,12,09,0);

//increment operator
x++;

//decrement operator 
x--;
//addition assignment operator  (x = x + 5)
x += 5;

//subtraction assigment operator (x = x - 5) etc.
x -= 5;

//using addition operator on String

String hello = 'Hello';
String world = 'world';
System.debug(hello + ' ' + world);

//AND operator &&
Boolean first = true;
Boolean second = false;
Boolean result;

result = first && second;

//OR ||
reslut = first || second;

//Equality operator
result = first == second;

//NOT operator
first = !first;

//Ternary operator
String greeting = '';

Integer hour = 10;

greeting = (hour < 12) ? 'Good morning' : 'Good afternoon';

/*
Split the Bill challenge
Pizza rates : 
1 slice - 8$/slice
2-3 slices - 7$/slice
>3 slices - 6$/slice

Ross ordered - 3 slices
Chandler - 1
Joey - 4

*/
final Integer SINGLE_SLICE = 8;
final Integer TWO_THREE = 7;
final Integer MORE_THAN_THREE = 6;


Integer rossOrder = 3;
Integer chandlerOrder = 1;
Integer joeyOrder = 4;

//Calculate how much Ross needs to pay
Integer rossHasToPay = rossOrder == 1 ? SINGLE_SLICE * rossOrder : (rossOrder <= 3 ? TWO_THREE * rossOrder : MORE_THAN_THREE * rossOrder);


    }
}
