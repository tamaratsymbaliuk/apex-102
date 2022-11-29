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
        

    }
}
