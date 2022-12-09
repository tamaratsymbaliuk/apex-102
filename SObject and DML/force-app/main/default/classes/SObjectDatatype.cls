public with sharing class SObjectDatatype {
    public SObjectDatatype() {
        List<Account> accounts = [SELECT Name, Phone FROM Account];

    

    //any standard or custom object is an SObject
    List<SObject> accounts = [SELECT Id, Name FROM Account];

    List<SObject> books = [SELECT Name, Price__c FROM Book__c];
    for(SObject book : books){
        System.debug('Book Name: ' + String.valueOf(book.get('Name')) + ' Book Price: ' + (Decimal)book.get('Price__c'));
    }

    //get Parent Object using SObject
    List<SObject> books = [SELECT Name, Price__c, Author__r.Name FROM Book__c];
    for(SObject book : books){
        System.debug('Book Name: ' + String.valueOf(book.get('Name')) + ' Book Price: ' + (Decimal)book.get('Price__c') + 
        ' Book Author: ' + (String)book.getSObject('Author__r').get('Name'));
    }

    //create New SObject record
    //create a new account sobject instance
    SObject accountRec = (SObject)Type.forName('Account').newInstance();
    accountRec.put('Name', 'Sample SObject Account');
    accountRec.put('Phone', '31288654555');

    insert accountRec;




}

}