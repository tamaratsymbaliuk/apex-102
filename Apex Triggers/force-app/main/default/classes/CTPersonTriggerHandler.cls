public with sharing class CTPersonTriggerHandler {
    public static void beforeInsert(List<Person__c> newRecords){
        //update health status to green and generate a unique token for the person record
        for(Person__c person : newRecords){
            person.Health_Status__c = 'Green';
            person.Token__c = CTPersonController.getToken(person.Mobile__c);
        }

    }

    public static void beforeUpdate(List<Person__c> newRecords, Map<Id,Person__c> oldRecordsMap){   //we need to compare old value and new value to check if status field was updated
        for(Person__c person : newRecords){
            //check if the status changed in this transaction, if so update Status_Update_Date__c to today
            if(person.Health_Status__c != oldRecordsMap.get(person.Id).Health_Status__c){
                person.Status_Update_Date__c = Date.today();
            }
        }
    }
}
