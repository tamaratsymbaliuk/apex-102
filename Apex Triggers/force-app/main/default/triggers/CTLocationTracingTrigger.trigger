trigger CTLocationTracingTrigger on Location_Tracing__c (before insert, after insert) {
    /**
     * check for duplicate records( if found - error , if not - add record)
     */
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            CTLocationTracingTriggerHandler.beforeInsert(Trigger.new);
        }
    }

}