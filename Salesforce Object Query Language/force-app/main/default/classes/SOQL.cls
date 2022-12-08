public with sharing class SOQL {
    public SOQL() {

}

//automaticly create a query > Dev console > File > Open Resourse  > select object > press comand and select fields > 
//click query button

/*
WHERE 

SELECT Name, Status FROM Lead WHERE (Status='Closed-Converted' OR Status ='Closed - Not Converted') AND LeadSource='Web'

IN - add multiple possible value for a field
WHERE Status IN ('Closed-Converted','Closed - Not Converted')

LIKE - match partial text string with support of wildcards (starts with).
Avoid using it as it leads to full table scan and degrades query performance
WHERE Status LIKE 'Closed%'
WHERE Title LIKE '%VP%'

ORDER BY CreatedDate DESC

LIMIT 10
SELECT Name, Status FROM Lead LIMIT 10

OFFSET 5 (maximum is 2000) - ignore first 5 records
SELECT Name, Status FROM Lead OFFSET 5

SOQL Operators ( =, !=, <,<=,>,>=,LIKE,IN,NOT IN)

DATE LITERALS (TODAY, YESTERDAY, TOMORROW,LAST_WEEK,THIS_WEEK,NEXT_WEEK, LAST_90_DAYS etc)
SELECT Name, Email FROM Lead WHERE CreatedDate=TODAY
*/

/*Relationship Queries

From Parent to Child(relationship field) only one level deep, upto 20 related objects are supported
Select Name, Number,(Select Name, Date FROM Child relationship Name field) FROM Parent
SELECT Name, Website,(SELECT Name FROM Contacts),(SELECT Name, Amount FROM Opportunities) FROM Account

FOR custom fields and objects needs to add __c and __r suffix
EX: SELECT Name,(SELECT Name FROM Books__r) FROM Author__c

-------------------------------------------------------------

FROM Child to Parent
Write your query on Child and fetch parent details from Parent field
SELECT Name, Phone, Department, Account.Name, Account.Website, Account.Owner.Name FROM Contact
SELECT Name,Price__c, Author__r.Name FROM Book__c

Child to Parent Query supports 5 level of child-to-parent relationships
Upto 55 related objects are supported


*/




}
