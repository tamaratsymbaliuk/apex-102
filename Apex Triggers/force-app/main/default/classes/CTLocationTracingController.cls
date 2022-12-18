/**
 * CTLocationTracingController
 * Main controller class for Location_Tracing__c object 
 * @author Tamara
 * */
public with sharing class CTLocationTracingController {
    /**
     * Get last 30 days visitors
     * @param locationId
     * @return List<Location_Tracing__c>
     */
        public static List<Location_Tracing__c> getVisitors(String locationId){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c FROM Location_Tracing__c WHERE Id =:locationId ORDER BY Visit_Date__c DESC];//using here bind variable so we can get the results for this location id
        
        //query Location Tracing records matching "locationId" value, sort by "Visit Date" DESC
        //return list of location tracing records
        }
    
        /**
         * Get all location ids for visitors
         * @param personIds
         * @return List<Location_Tracing__c>
         */
        public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){
       //query location tracing records where Person matches the "personIds"; only retrieve records where Visit Date is in last 10 days
      return [SELECT Id, Person__c, Location__c FROM Location_Tracing__c WHERE Person__c IN :personIds AND Visit_Date__c = LAST_N_DAYS:10 ORDER BY Visit_Date__c  DESC];//IN because we compering with Set/List
      // return list of location tracing records
        }
    
        /**
         * Get all visito ids for locations
         * @param locationIds
         * @return List<Location_Tracing__c>
         */
        public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
      return [SELECT Id, Person__c, Location__c FROM Location_Tracing__c WHERE Location__c IN :locationIds AND Person__r.Health_Status__c = 'Green' AND Visit_Date__c = LAST_N_DAYS:10];    
        //query location tracing records where location matches the "locationIds" and Person health is "Green"
        //only retrieve records where Visit Date is in the last 10 days
        //return list of location tracing records
        }
    
        public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newlocationTraces){
        //query existing records from Location Tracing object, find duplicare records by matching locationTraces list and existing records
        //return list of duplicate Location tracing records
        /**
         * Algorithm-
         * 1. Iterate over the new location tracing records to get all unique location ids and person ids.
         * 2. Query existing location tracing records using ids collected in setp 1(checking what records already exist in our system)
         * 3. Create a Map<locationId, Set<personId>>. This will make our task easier to find duplicates
         * 4. Loop over new location tracing records and check for duplicates in Map(created in step 3)
         * 5. Return the list of duplicates
         */
    
         //store unique location ids
         Set<Id> locationIds = new Set<Id>();
         //store unique person ids
         Set<Id> personIds = new Set<Id>();
    //1
         for(Location_Tracing__c trace : newlocationTraces){
             locationIds.add(trace.Location__c);
             personIds.add(trace.Person__c);
         }
         //2
         List<Location_Tracing__c> existingRecords = [SELECT Id, Person__c, Location__c 
                                                         FROM Location_Tracing__c 
                                                         WHERE Location__c IN :locationIds 
                                                         AND Person__c IN :personIds];  
        
        //3
        //map of location id, set of person ids
        Map<Id,Set<Id>> mapOfExistingRecords = new Map<Id,Set<Id>>();
        //4 list of duplicate records
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();
    
    
         if(existingRecords != null && existingRecords.size() > 0){
            for(Location_Tracing__c trace : existingRecords){
                if(!mapOfExistingRecords.containsKey(trace.Location__c)){
                    mapOfExistingRecords.put(trace.Location__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);
                /*String locationId = trace.Location__c;
                String personId = trace.Person__c;
                //check if map already has the locationId key
                if(!mapOfExistingRecords.containsKey(locationId)){
                    // map does not have this key
                    // add this new item in the map using location id as key
                    // and blank Set<Id> as value
                    mapOfExistingRecords.put(locationId,new Set<Id>());
                }
                // get map item using locationId key
                Set<Id> personIds = mapOfExistingRecords.get(locationId);
                // add the person id to the set
                personIds.add(personId);
                //overwrite the existing map value
                mapOfExistingRecords.put(locationId, personIds);
                */
        }
    
        //4 loop over new location tracing records
        for(Location_Tracing__c trace : newlocationTraces){
            //first check for location id
            // if item found in map, then check for person in set
            if(mapOfExistingRecords.containsKey(trace.Location__c) && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)){
                duplicates.add(trace);
            }
           }
           
        }
        return duplicates;
        
                                                        
    
    
    
    }
    }
    
    