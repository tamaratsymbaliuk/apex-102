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



}
}
