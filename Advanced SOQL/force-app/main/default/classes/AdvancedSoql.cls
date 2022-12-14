public with sharing class AdvancedSoql {
    /**
     * Aggregate Functions - allow to roll up and summarize data in a query.
     * Avg(), Count(),Count(fieldName),Count_Distinct(),Min(),Max(),Sum()
     */
    //max opp amount
    //SELECT Max(Amount) FROM Opportunity;


    /**
     * GROUP By Clause
     * Number of Leads associated with each Lead Source
     SELECT LeadSource, Count(Id) FROM Lead GROUP BY LeadSource;
     * Max opp amount in each stage
     SELECT StageName, Count(Id), Max(Amount) FROM Opportunity GROUP BY StageName, LeadSource
     */


     /**
     HAVING Clause
     Group by StageName where Sum of amount is greather than 500k
     SELECT StageName, SUM(Amount) FROM Opportunity GROUP BY StageName HAVING SUM(AMOUNT)>500000
     
      */


      /**
      Aggregate Functions in APEX (array as AggregateResult(Datatype))

      AggregateResult[] groupedResults = [SELECT AVG(Amount), MAX(Amount) FROM Opportunity];
      Double avgAmount = Double.valueOf(groupedResulrs[0].get('expr0'));
      Double maxAmount = Double.valueOf(groupedResults[0].get('expr1'));

      Ex: in Dev Console run the code below
*/
      AggregateResult[] groupedResult = [SELECT StageName, Max(Amount), Min(Amount), Avg(Amount) FROM Opportunity GROUP BY StageName];
      for(AggregateResult result : groupedResult){
          System.System.debug('StageName: ' + result.get('StageName') + ' Max Amount: ' + result.get('expr0') + ' Min Amount: ' + result.get('expr1') + ' Avg Amount: ' + result.get('expr2'));

      }
       // or you allias instead of expressions
    
AggregateResult[] groupedResult = [SELECT StageName, Max(Amount) maxAmount, Min(Amount)minAmount, Avg(Amount)avgAmount FROM Opportunity GROUP BY StageName];
      for(AggregateResult result : groupedResult){
          System.System.debug('StageName: ' + result.get('StageName') + ' Max Amount: ' + result.get('maxAmount') + ' Min Amount: ' + result.get('minAmount') + ' Avg Amount: ' + result.get('avgAmount'));
      
      

}
