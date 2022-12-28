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
  /**
   * Get count of locations in each status
   * @return Map<String,Integer>
   */
  public static Map<String, Integer> getStatusCount(){
  //query Location records to find Number of Locations in each Health Status
  //build a Map<String,Integer> to map count of location with each status 
  //return the map
  Map<String,Integer> healthCountMap = new Map<String, Integer>();
  for(AggregateResult result : [SELECT Status__c, Count(Id)total FROM Location__c GROUP BY Status__c ]){
    healthCountMap.put(String.valueOf(result.get('Status__c')), Integer.valueOf(result.get('total')));
  }
  return healthCountMap;


  
}

public static void updateRedScore(Set<Id> locationIds){
List<Location__c> locationToUpdate = new List<Location__c>();
 AggregateResult[] redPeoplePerLocation = [SELECT Location__c, COUNT(Id) total FROM Location_Tracing__c 
                   WHERE Person__r.Health_Status__c = 'Red' 
                   AND Visit_Date__c = LAST_N_DAYS:10 
                   AND Location__c IN : locationIds 
                   GROUP BY Location__c];

 for (AggregateResult ar : redPeoplePerLocation){
   String locationId = String.valueOf(ar.get('Location__c'));
   Integer redScore = Integer.valueOf(ar.get('total'));
   String status = getStatus(redScore);
   locationToUpdate.add(new Location__c(Id=locationId, Red_Score__c=redScore,Status__c=status));
 }
 if(locationToUpdate != null && locationToUpdate.size() > 0){
   update locationToUpdate;
 }
}

public static String getStatus(Integer redScore){
  if(redScore == 0){
    return 'Green';
  }else if(redScore <= 5){
    return 'Yellow';
  }else if(redScore <= 10){
    return 'Orange';
  }else{
    return 'Red';
  }

}
  public static Map<String, Integer> getHealthStatusCount(){
        AggregateResult[] healthCountMap = [SELECT Status__c, Count(Id) total FROM Location__c GROUP BY Status__c];

        if(healthCountMap != null && healthCountMap.size() > 0){
            Map<String, Integer> result = new Map<String, Integer>();
            for(AggregateResult ar : healthCountMap){
                result.put(String.valueOf(ar.get('Status__c')), Integer.valueOf(ar.get('total')));
            }
            return result;
        }
        return null;
    }
}
