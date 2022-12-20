trigger CTLocationTrigger on Location__c (before insert, after insert, before update, after update ) {
    /**
     * location status needs to be "Green" before inserting the records
     * if location status changes, update status update date
     * if a location Status changes to RED, mark all people Yellow who have visited the location in the last 10 days(except the Red and Orange ones)
     */
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            CTLocationTriggerHandler.beforeInsert(Trigger.new);

        }
        when BEFORE_UPDATE{
            CTLocationTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_UPDATE{
           CTLocationTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap); 
         }
    }
}