trigger LeadTrigger on Lead (before insert, before update, after update) {
    /*System.debug('Trigger size: ' + Trigger.size);
    System.debug('is trigger: ' + Trigger.isExecuting);
    System.debug('Operation type: ' + Trigger.operationType);
    */

    switch on Trigger.operationType{
        when BEFORE_INSERT{
            for(Lead leadRecord : Trigger.new){
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

    when BEFORE_UPDATE{
         for(Lead leadRecord : Trigger.new){
            // if lead source is blank, then make is "other"
            if(String.isBlank(leadRecord.LeadSource)){
               leadRecord.LeadSource = 'Other';
              }
              if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted'){
                leadRecord.Status.addError('You cannot directly close an open lead record');
            }

    }
 
       

 }
}
}