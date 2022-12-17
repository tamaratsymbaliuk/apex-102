trigger CTPersonTrigger on Person__c (before insert, after insert, before update, after update, before delete, after delete) {
    /**
     * The trigger shoudl accept all events
     * the persons health status shoudl be Green while inserting a record
     * generate a unique token for the person when a new record is inserted
     * when health status updates, update the "Status_Update_Date__c" date field
     * If persons Health status changes, update the Red Score and Status of all the locations they visited in last 10 days
     * If persons Health status updates to Red, mark all people "Cohabitants" Orange - except the red and orange ones
     * marl all primary contacts Orange - except the Red and Orange ones
     * mark all people "Neighbors" Yellow - except the Red, Orange and Yellow ones
     * mark all secondary contacts Yellow - except the Red and Orange ones
     * update the Red Score and Status of all the locations they visited in last 10 days
     */

     switch on Trigger.operationType{
         when BEFORE_INSERT{
             //update health status to green and generate a unique token for the person record
             CTPersonTriggerHandler.beforeInsert(Trigger.new);
         }
         when BEFORE_UPDATE{
             CTPersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);

         }
     }

}