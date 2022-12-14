public with sharing class AccountContactService {
    public static void updateActiveContacts(Set<Id> accountIds){
        //get aggregate result for all accounts
        List<AggregateResult> results = [SELECT AccountId, Count(Id) totalContacts FROM Contact WHERE Active__c = true AND AccountId IN :accountIds GROUP BY AccountId];
        //build final list of accounts to update (using map in case there is no active contacts under account and query returns null)  
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();   
        for(AggregateResult result : results){
            //get accoint id and number of active contacts
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            //make sure you use Id field in your account to update it
            Account acc = new Account(Id=accId, Active_Contacts__c=totalContacts);
            accountsToUpdate.put(accId, acc);
        }
        // update accounts with zero active contacts
        for(Id accId : accountIds){
            if(!accountsToUpdate.containsKey(accId)){
                accountsToUpdate.put(accId, new Account(Id=accId, Active_Contacts__c=0));
            }
        }
        //update the final list of accounts
        update accountsToUpdate.values();

    }
}
