public with sharing class DMLChallenge {
    public DMLChallenge() {
        //create a new account and give name and rating
        Account account = new Account(Name='WingNut Films',Rating='Warm');
        insert account;

        //create an opp for this account with Stage=Qualification, Closed Date=Today
        Opportunity opp = new Opportunity(Name='Lord Of The Rings',StageName='Qualification',CloseDate=Date.today());
        insert opp;
        opp.AccountId = account.Id;//or pass id directly

        //update account name 
        Account acc = [SELECT Id, Name FROM Account WHERE Name='WingNut Films' LIMIT 1];
        acc.Name = 'New Line Cinema';
        update acc;

        //update opportunity stage
        Opportunity opp  = [SELECT Id, Name,StageName FROM Opportunity WHERE Name='Lord  Of The Rings' LIMIT 1];
        opp.StageName = 'Closed Won';
        update opp;

        //delete the opp
        Opportunity opp  = [SELECT Id, Name,StageName FROM Opportunity WHERE Name='Lord  Of The Rings' LIMIT 1];
        delete opp;

        //undelete the opp
        List<Opportunity> opp  = [SELECT Id, Name,StageName FROM Opportunity WHERE IsDeleted=true ALL ROWS];
        undelete opp;




    }
}
