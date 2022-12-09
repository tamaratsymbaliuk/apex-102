public with sharing class DML {
    public DML() {

        //DML - Data Manipulation Language

        //create an account
        Account acc = new Account(Name='Infoteck',Phone='3124567899');
        acc.Rating = 'Hot';
        insert acc;

        //insert/create a list of accounts

        List<Account> accounts = new List<Account>();
        Account acc1 = new Account(Name='Test Account 1');
        Account acc2 = new Account(Name='Test Account 2');
        Account acc3 = new Account(Name='Test Account 3');
        Account acc4 = new Account(Name='Test Account 4');
        accounts.add(acc1);
        accounts.add(acc2);
        accounts.add(acc3);
        accounts.add(acc4);

        insert accounts; // doesn't allow PARTIAL success of DML operation. If one record fails, 
        //complete transaction willl be rolled back; Results in exception

        //Number of DML statements: 1 out of 150
        //Number of DML rows: 4 out of 10000
        /*
        Number of DML statements is total insert/update/delete/undelete statement in a single transaction
        Number of DML rows is the records inserted/updated/deleted/undeleted
        */

        Database.insert(accounts,false); // allow PARTIAL success of DML operation; NO exception is thrown


        /*
        Database Methods vs DML Statements
        */

        Database.SaveResult[] srList = Database.insert(accList,false);
        //vs
        insert accList;

    }
}
