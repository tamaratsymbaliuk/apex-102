public with sharing class BulkificationChallenge {
    public BulkificationChallenge() {

        /*
        It team created a new number field "Avg_Case_Resolution_Days__c" on account object.A developer created a 
        method "updateAvgCaseResolutionDays()" to corretly update this field. The team noticed that the current code
        does not work for multiple accounts and can only work for one account at a time. Bulkify current method to handle
        multiple accounts update at once.
        */

    }
    public static void updateAvgCaseResolutionDays(Id accountId){
        Integer totalDays = 0, totalCases = 0;
        //retrive all the cases for this account
        //get resolution days for each account(ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate FROM Case WHERE isClosed=true AND AccountId =: accountId]){
            //increase number of cases
            totalCases++;
            //get duration in days and add it to totalDays
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
        }
        Decimal resolutionDays = totalDays/totalCases;
        //update account object
        Account acc = new Account(Id=accountId,Avg_Case_Resolution_Days__c = resolutionDays);
        update acc;
    }

    //updated code
    public static void updateAvgCaseResolutionDays(List<Id> accountIds){
        //create 2 maps to store accoint id and case total days and total cases
        Map<Id,Integer> accountTotalCaseMap = new Map<Id,Integer>(); //map has no duplicates
        Map<Id,Integer> accountTotalCaseDaysMap = new Map<Id,Integer>();
        //get all closed cases for all accounts
        //get resolution days for each account(ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate, AccountId FROM Case WHERE isClosed=true AND AccountId IN : accountIds]){
            //if map does not have current account id, then add it
            if(!accountTotalCaseMap.containsKey(caseObj.AccountId)){
                accountTotalCaseMap.put(caseObj.AccountId,0); //value 0 number of totalCases
                accountTotalCaseDaysMap.put(caseObj.AccountId, 0);//value 0 number of totalDays
              
            }
            //get total number of cases per account id
            Integer totalCases = accountTotalCaseMap.get(caseObj.AccountId);
            //increase number of cases
            totalCases++;
            //update case number again
            accountTotalCaseMap.put(caseObj.AccountId, totalCases);
            //get duration in days and add it to totalDays
            Integer totalDays = accountTotalCaseDaysMap.get(caseObj.AccountId);
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
            //update total days again
            accountTotalCaseDaysMap.put(caseObj.AccountId, totalDays);
        }
        //iterate over the map, doesn't matter which one,calculate avr resolution days and add account to a list
        List<Account> accountToUpdate = new List<Account>();
        for(Id accountId : accountTotalCaseMap.keySet()){
            Decimal resolutionDays = accountTotalCaseDaysMap.get(accountId)/accountTotalCaseMap.get(accountId);
        //update account object
        accountToUpdate.add(new Account(Id=accountId,Avg_Case_Resolution_Days__c = resolutionDays));

        }
        
        update accountToUpdate;
    }
}
