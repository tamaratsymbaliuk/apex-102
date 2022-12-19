trigger CTLocationTrigger on Location__c (before insert, after insert, before update, after update ) {
    /**
     * location status needs to be "Green" before inserting the records
     * if location status changes, update status update date
     */
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            CTLocationTriggerHandler.beforeInsert(Trigger.new);

        }
        when BEFORE_UPDATE{
            CTLocationTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}