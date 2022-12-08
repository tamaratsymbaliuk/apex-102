public with sharing class SOQLinAPEX {
   
    public SOQLinAPEX() {
        //retrive a list of accounts
        List<Account> accounts = [Select Name,Phone FROM Account];
        for(Account account : accounts){
            System.debug('Account Name: ' + account.Name + 'Account Phone');
}

//retrive map of accounts
Map<Id,Account> accountsMap = new Map<Id,Account>([Select Name,Phone FROM Account]);

for(Account account : accountsMap.values()){ //use values() method to get the List of values,use keySet() to get set of keys
    System.debug('Account Name: ' + account.Name + 'Account Phone');

}
//list of contacts
List<Contact> contacts = [Select Account.Name, Account.Rating,(Select CaseNumber, Subject From Cases) From Contact ORDER BY Name];
for(Contact contact : contacts){
    System.debug('Contact Name: ' + contact.Name + ', Contact Title: ' + contact.Title + ' Account name: ' + contact.Account.Name);
    //since the case is child on contact, we need another for loop to print out case info
    for(Case caseObj : contact.Cases){
        System.debug('Case Number: ' + caseObj.CaseNumber + ' Case subject: ' + caseObj.Subject);
    }
}
//BINDING Variables in SOQL. Can be used as: Filter literals in WHERE clauses; The value of the IN or NOT IN operator in WHERE 
//clauses(with List of Ids or Strings); numeric value in LIMIT and OFFSET clauses.

Set<Id> accountIds = new Set<Id>();
[SELECT Id, Name, Rating FROM Account WHERE Id IN :accountIds ];

String leadName = 'XYZ Corp';
[SELECT Id, Name FROM Lead WHERE Name =:leadName];

List<String> accountNames = new List<String>();
accountNames.add('Add-ons');
accountNames.add('Big Sky & Sons');

List<Account> accounts = [SELECT Id, Name, Rating FROM Account WHERE Name IN :accountNames]; // here we used binding varieble 
//instead of writing IN('Add-ons','Big Sky & Sons')
System.debug('Account Size: ' + accounts.size());
System.debug('Accounts ' + accounts);


/*
----------------------------------------
DYNAMIC SOQL Queries

List<Account> accounts = Database.query();
*/

String accountClass = 'Class1';
String queryString = 'SELECT Id, Name, Phone, Rating FROM Account';

if(accountClass == 'Class1'){
    queryString += ' WHERE Rating=\'Hot\' AND Type =\'Partner\'';
}else if(accountClass == 'Class2'){
        queryString =+ ' WHERE Rating=\'Warm\' AND Type =\'Other\'';
    }else{
        queryString += ' WHERE Rating=\'Hot\'';
    }

    List<Account> accounts = Database.query(queryString);
    System.debug('Accounts ' + accounts);
    System.debug('Accounts size ' + accounts.size());

    }
}



