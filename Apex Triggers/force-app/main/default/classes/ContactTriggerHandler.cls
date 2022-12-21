public with sharing class ContactTriggerHandler {
    public static void afterInsertHandler(List<Contact> newContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact contact : newContacts){
            if(String.isNotBlank(contact.AccountId)){
                //write automation logic here
                accountIds.add(contact.AccountId);
            }
        }
        AccountContactService.updateActiveContacts(accountIds);
    }
    public static void afterUpdateHandler(List<Contact> newContacts, Map<Id, Contact> oldContactsMap){
        Set<Id> accountIds = new Set<Id>();
            for(Contact contact : newContacts){
                //capture the account id only if active checkbox value is flipped
                if(String.isNotBlank(contact.AccountId) && oldContactsMap.get(contact.Id).Active__c != contact.Active__c){
                    //wrtite automation logic here
                    accountIds.add(contact.AccountId);
                }else if(oldContactsMap.get(contact.Id).AccountId != contact.AccountId){
                    accountIds.add(contact.AccountId);
                    accountIds.add(oldContactsMap.get(contact.Id).AccountId);
                }
            }
            AccountContactService.updateActiveContacts(accountIds);

    }
    public static void afterDeleteHandler(List<Contact> deletedContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact contact : deletedContacts){
            if(String.isNotBlank(contact.AccountId)){
                //wrtite automation logic here
                accountIds.add(contact.AccountId);

    }
}
AccountContactService.updateActiveContacts(accountIds);
    }

    public static void afterUndeleteHandler(List<Contact> newContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact contact : newContacts){
            if(String.isNotBlank(contact.AccountId)){
                //wrtite automation logic here
                accountIds.add(contact.AccountId);

    }
}
AccountContactService.updateActiveContacts(accountIds);
    }
 }

