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


}
