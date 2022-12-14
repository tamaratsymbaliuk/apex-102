public with sharing class LeadTriggerHandler {

    public static void beforeInsertHandler(List<Lead> newRecords){
        for(Lead leadRecord : newRecords){
            // if lead source is blank, then make is "other"
            if(String.isBlank(leadRecord.LeadSource)){
               leadRecord.LeadSource = 'Other';
              }
              //validation rule on Industry field 
   if(String.isBlank(leadRecord.Industry)){ // fire only when record gets created
    leadRecord.addError('The industry field cannot be blank');
}
    }
    }
    public static void afterInsertHandler(List<Lead> newRecords){
        List<Task> leadTasks = new List<Task>();
        for(Lead leadRecord : newRecords){
            //create a task
            Task leadTask = new Task(Subject='Follow up on Lead Status',WhoId=leadRecord.Id);//map our task to current lead record
            leadTasks.add(leadTask);
        }
        insert leadTasks;
    }
    
    public static void beforeUpdateHandler(List<Lead> newRecords, Map<Id, Lead> oldRecordsMap){
        for(Lead leadRecord : newRecords){
            // if lead source is blank, then make is "other"
            if(String.isBlank(leadRecord.LeadSource)){
               leadRecord.LeadSource = 'Other';
              }
              if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && oldRecordsMap.get(leadRecord.Id).Status == 'Open - Not Contacted'){
                leadRecord.Status.addError('You cannot directly close an open lead record');
            }

    }

    }
}
