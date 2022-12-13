public with sharing class CTLocationController {

    /**
     * Get 100 locations with recent status change
     * @return List<Location__>
     */
    public static List<Location__c> getRecentStatusChanges(){
    //query Location records[all fields] limit the result to 100, sort by "status update Date" in DESC
   return  [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    //return list of location records
  }

/**
 * search a location by name, zipcode or adress
 * @return List<Location__c>
 */
  public static List<Location__c> searchLocations(String searchTerm){
      searchTerm = searchTerm + '%';
//query Location records [all fields] where either "Name","PinCode" or "Address" matches the search term.sort by Status Update Date
//return list of location
return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c 
WHERE Name LIKE :searchTerm OR Pincode__c LIKE :searchTerm OR Address__c LIKE :searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST];
   
  }

  /**
   * search location by id
   * @return Location__c
   */
  public static Location__c getLocationById(String locationId){
      //query a location record [all fields] where Id matches the "locationId" parameter value 
  //return the Location record
      List<Location__c> locations = [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c 
      WHERE Id =: locationId]; //it's better to store in list rether than location record in case there willl be invalid id. List wil not throw exceptions
      if(locations != null && locations.size() > 0){
        return locations[0];
    } 
    return null;
  
  }
}
