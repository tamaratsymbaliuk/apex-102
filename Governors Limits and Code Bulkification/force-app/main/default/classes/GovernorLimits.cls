public with sharing class GovernorLimits {
    public GovernorLimits() {

        //Bulkification - ensure your code can properly process more than one record at a time
        //see example OpportunityController ; Never write SOQL and DML statements in LOOPS

        //Apex CPU timeout exception

        /*
        LIMITS CLASS
        getDMLStatements() - returns the number of DML statements(such as insert, update or the database.EmptyRecycleBin() method)
        getHeapSize() - returns the approximate amount of memory that has been used for the heap
        getCPUTime();
        etc.
        */

        //HEAP SIZE limit errors

        List<Account> accounts = [SELECT Id, Type, Name FROM Account];
        //instead it's better to use large query in for loop as you only retrieve 200 records at a time
        for(Account acc : [SELECT Id, Type, Name FROM Account]){
            
        }


        

    }
}
