public with sharing class CTRecentChangesController {
    //return people details sorted by status update date in DESC
    @AuraEnabled
    public static List<Person__c> getRecentPersonHealthChanges(){
        return CTPersonController.getRecentHealthChanges();

    }

    //return location details sorted by status update date in DESC
    @AuraEnabled
    public static List<Location__c> getRecentLocationHealthChanges(){
        return CTLocationController.getRecentStatusChanges();

    }

    //return people matching a searchTerm
    @AuraEnabled 
    public static List<Person__c> searchPeople(String searchTerm){
        return CTPersonController.searchPeople(searchTerm);

    }


    //return locations matching a searchTerm
    @AuraEnabled
    public static List<Location__c> searchLocation(String searchTerm){
        return CTLocationController.searchLocations(searchTerm);

    }
    
}
