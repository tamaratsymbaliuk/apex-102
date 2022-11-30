public with sharing class StringClassMethods {
    public StringClassMethods() {
String str = 'apple';
System.debug('Actual String ' + str);

//capitalize string
System.debug('Capitalize String: ' + str.capitalize());

//contains 
System.debug('Contains orange?: ' + str.contains(str));

//to upper case
System.debug('Upper case: ' + str.toUpperCase(str));

//to lower case
Systrem.System.debug('Lower case: ' + str.toLowerCase(str));
        
//equals
System.debug('Is equal to Apple? ' + str.equals(str));

//remove
System.debug('Remove p: ' + str.remove('p'));

//replace
System.debug('Replace apple with orange: ' + str.replace('apple', 'orange'));

//split
System.debug('Split by space ' + str.split(' '));

//trim - removes whitespace

//isBlank - true/false

//isEmpty - true/false

//isNumeric - return true if the current String contains only Unicode digits;

    }
}
