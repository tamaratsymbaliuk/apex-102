public with sharing class CTPersonController {
 
    /**
     * create a method to accept a string parameter(Mobile num),generate a secure token using MD5 hashing
     * @return List<Person__c>
     */
    public static String getToken(String mobileNumber){
        Blob value = Blob.valueOf(mobileNumber);
        Blob hash = Crypto.generateDigest('MD5', value);

        //get the string value of hash blob
        return EncodingUtil.base64Encode(hash);
    }
   //get 100 contacts with recent health status change
    public static List<Person__c> getRecentHealthChanges(){
        //query Person records [all fields] Limit the result to 100; sort by "Status Update Date" in descending order
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
        FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        //return List of Person records 
     
    }
/**
 * Search a person by name, token or mobile
 * @return List<Person__c>
 */
    public static List<Person__c> searchPeople(String searchTerm){
        //query Person records [all fields] where either Name, Mobile or Token matches the search term
         //sort by "status update date" in descending order;return list of Persons
        searchTerm = searchTerm + '%'; //to use like a binding variable
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
        FROM Person__c 
        WHERE Name LIKE :searchTerm 
        OR Mobile__c LIKE :searchTerm 
        OR Token__c LIKE :searchTerm 
        ORDER BY Status_Update_Date__c DESC NULLS LAST];
        

    }
    /**
     * Search a person by id
     * @return Person__c
     */
    public static Person__c getPersonById(String personId){
        //query a Person record [all fields] where Id matches the "personId" parameter value, //return the Person record
       List<Person__c> people =  [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c WHERE Id =: personId]; 
        if(people != null && people.size() > 0){
            return people[0];
        } 
        return null;
    }

/**
Get count of people in each health status
@return Map<String,Integer>
 */
     public static Map<String,Integer> getHealthStatusCount(){
    //query Person records to find Number of People in each Health Status
    //build a Map<String,Integer> to map count of people with each status 
    //return the Map 

    //AggregateResult[] personHealth = [SELECT Health_Status__c, COUNT(Id)total FROM Person__c GROUP BY Health_Status__c];
    // or use in a loop directly
    Map<String,Integer> healthCountMap = new Map<String, Integer>();
    for(AggregateResult result : [SELECT Health_Status__c, COUNT(Id)total 
                                     FROM Person__c 
                                     GROUP BY Health_Status__c]){
      String healthStatus = String.valueOf(result.get('Health_Status__c'));
      Integer count = Integer.valueOf(result.get('total'));
      healthCountMap.put(healthStatus,count);

    }
    return healthCountMap;
    

     }
     //using set to get unique ids
     public static Set<Id> getCohabitants(Set<Id> personIds){
         List<String> healthStatuses = new List<String>{'Green','Yellow'};
         //adding or condition since same person can be on Person1 or Person2 field
        List<People_Tracing__c> peopleTraces =  [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                 WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                 AND Contact_Type__c = 'Cohabitant'
                                                 AND (Person_1__c.Health_Status__c IN :healthStatuses OR Person_2__c.Health_Status__c IN :healthStatuses)];
        Set<Id> cohabitants = new Set<Id>();
        for(People_Tracing__c pt : peopleTraces){
            if(!personIds.contains(pt.Person_1__c)){
                cohabitants.add(pt.Person_1__c);
            }
            if(!personIds.contains(pt.Person_2__c)){
                cohabitants.add(pt.Person_2__c);
            }
         }
         return cohabitants;
     }

     public static Set<Id> getNeighbours(Set<Id> personIds){
        //adding or condition since same person can be on Person1 or Person2 field
       List<People_Tracing__c> peopleTraces =  [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                AND Contact_Type__c = 'Neighbour'
                                                AND (Person_1__c.Health_Status__c = 'Green' OR Person_2__c.Health_Status__c = 'Green')];
       Set<Id> neighbours = new Set<Id>();
       for(People_Tracing__c pt : peopleTraces){
           if(!personIds.contains(pt.Person_1__c)){
               neighbours.add(pt.Person_1__c);
           }
           if(!personIds.contains(pt.Person_2__c)){
               neighbours.add(pt.Person_2__c);
           }
        }
        return neighbours;
    }

    public static Set<Id> getPrimaryContact(Set<Id> personIds){
        List<String> healthStatuses = new List<String>{'Green','Yellow'};
        //adding or condition since same person can be on Person1 or Person2 field
       List<People_Tracing__c> peopleTraces =  [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                AND Contact_Type__c = 'Other'
                                                AND (Person_1__c.Health_Status__c IN :healthStatuses OR Person_2__c.Health_Status__c IN :healthStatuses)
                                                AND Contact_Date__c = LAST_N_DAYS:10];//using binding variable to get more than one status
       Set<Id> primaryContacts = new Set<Id>();
       for(People_Tracing__c pt : peopleTraces){
           if(!personIds.contains(pt.Person_1__c)){
               primaryContacts.add(pt.Person_1__c);
           }
           if(!personIds.contains(pt.Person_2__c)){
               primaryContacts.add(pt.Person_2__c);
           }
        }
        return primaryContacts;
    }

}
