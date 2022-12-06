public with sharing class ApexTesting {
    public ApexTesting() {

        }

     /*
        Annotations
        */
@deprecated
//This method is deprecated. Use playGame2022() instead
        public void playGame(){

        }

        /*
        https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation.htm
        Apex supports the following annotations.
@AuraEnabled
@Deprecated
@Future
@InvocableMethod 
@InvocableVariable
@IsTest
@JsonAccess
@NamespaceAccessible
@ReadOnly
@RemoteAction
@SuppressWarnings
@TestSetup
@TestVisible
        */

//Unit Testing - test individual parts (units) of your software;
//Test Runner - a unit test is a function that is executed by a software called a test-runner;
/*
APEX UNIT TEST example

@isTest
public class MyClass{

    @isTest
    public static void myTest(){
        //a test method can be either public or global. It must be static and must not return a value.
    }
}


SEE Covid19 class and it's test class
*/



}
