public with sharing class OpportunityController {
    public OpportunityController() {
        /*write a function that can take list of opp record ids. 
        //Query these records
        //if amount <10000 update profile to Low
        //if amount is >10k and <50k update to Medium
        if amount is >50k update to High*/

    }

    public static void updateProfile(List<Id> oppIds){
        for(Id oppId : oppIds){
            //get record
           Opportunity opp =  [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id =: oppId];//not optimized SOQL 101 limit
           if(opp.Amount == null){
               opp.Profile__c ='';
           }else if(opp.Amount < 10000){
               opp.Profile__c = 'Low';
           }else if(opp.Amount > 50000){
               opp.Profile__c = 'High';
           }else{
               opp.Profile__c = 'Medium';
           }
           update opp; //not optimized Too many DML statements: 151
        }
    }

        //modified code
        public static void updateProfile(List<Id> oppIds){

            List<Opportunity> opps =  [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id IN: oppIds];

            for(Opportunity opp : opps){
               
               if(opp.Amount == null){
                   opp.Profile__c ='';
               }else if(opp.Amount < 10000){
                   opp.Profile__c = 'Low';
               }else if(opp.Amount > 50000){
                   opp.Profile__c = 'High';
               }else{
                   opp.Profile__c = 'Medium';
               }
               
    }
    update opps;

}
}