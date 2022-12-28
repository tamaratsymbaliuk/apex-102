public with sharing class CTHealthHeaderController {
    // should return count of people in each health status
    @AuraEnabled
    public static Map<String, Integer> getPersonHealthStatuscount(){
        return CTPersonController.getHealthStatusCount();
    }
// should return count of locations in each health status
    @AuraEnabled
    public static Map<String, Integer> getLocationHealthStatuscount(){
        return CTLocationController.getHealthStatusCount();
    }
}

