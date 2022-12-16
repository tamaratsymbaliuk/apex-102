trigger CTPersonTrigger on Person__c (before insert, after insert, before update, after update, before delete, after delete) {
    /**
     * The trigger shoudl accept all events
     * the persons health status shoudl be Green while inserting a record
     * generate a unique token for the person when a new record is inserted
     * when health status updates, update the "Status_Update_Date__c" date field
     */

     switch on Trigger.operationType{
         when BEFORE_INSERT{
             //update health status to green and generate a unique token for the person record
             CTPersonTriggerHandler.beforeInsert(Trigger.new);
         }
     }

}