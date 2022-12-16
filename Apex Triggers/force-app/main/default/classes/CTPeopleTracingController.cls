public with sharing class CTPeopleTracingController {
    

    public static List<People_Tracing__c> getTraces(String personId){
   //query People Tracing records matching "recordId" value,sort by "Contact Date" DESC
    //retrun list
    return [SELECT Id, Contact_Date__c, Person_1__c, Person_1__r.Health_Status__c, Person_1__r.Token__c, Person_2__c, Person_2__r.Health_Status__c, Person_2__r.Token__c FROM People_Tracing__c WHERE Person_1__c =:personId OR Person_2__c =:personId ORDER BY Contact_Date__c DESC];
    }



    public static List<People_Tracing__c> checkDuplicates(List<People_Tracing__c> newPeopleTraces){
     //query existing records from People Tracing object
    //find duplicate records by matching peopleTraces list and existing records(more challenging since people tracing object has 
    //2 Person1 and Person2 fields. So It can be only record with either Mike and Toma and Toma and Mike combination)
    //return List of duplicate People Tracing records

       // unique person ids
        Set<Id> personIds = new Set<Id>();
        for (People_Tracing__c trace : newPeopleTraces) {
            personIds.add(trace.Person_1__c);
            personIds.add(trace.Person_2__c);
        }

        // list duplicate records
        List<People_Tracing__c> duplicates = new List<People_Tracing__c>();

        // map id and set<id>
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();

        // query existing records
        List<People_Tracing__c> existingRecords = [SELECT Id, Person_1__c, Person_2__c 
                                                    FROM People_Tracing__c
                                                    WHERE Person_1__c IN :personIds
                                                        OR Person_2__c IN :personIds];

        if(existingRecords != null && existingRecords.size() > 0){
            for (People_Tracing__c trace : existingRecords) {
                if(! mapOfExistingRecords.containsKey(trace.Person_1__c)){
                    mapOfExistingRecords.put(trace.Person_1__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Person_1__c).add(trace.Person_2__c);

                // build map for person 2
                if(! mapOfExistingRecords.containsKey(trace.Person_2__c)){
                    mapOfExistingRecords.put(trace.Person_2__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Person_2__c).add(trace.Person_1__c);
            }

            // loop over existing records to find duplicates
            for (People_Tracing__c trace : newPeopleTraces) {
                //checkfor duplicates in map
                if(
                    (mapOfExistingRecords.containsKey(trace.Person_1__c) && mapOfExistingRecords.get(trace.Person_1__c).contains(trace.Person_2__c)) 
                    ||
                    (mapOfExistingRecords.containsKey(trace.Person_2__c) && mapOfExistingRecords.get(trace.Person_2__c).contains(trace.Person_1__c))
                ){
                    duplicates.add(trace);
                }
            }
        }
        return duplicates;
    }
}
