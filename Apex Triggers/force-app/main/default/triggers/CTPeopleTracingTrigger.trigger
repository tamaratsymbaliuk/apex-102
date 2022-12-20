trigger CTPeopleTracingTrigger on People_Tracing__c (before insert, after insert) {
    /**
     * check for duplicate records (if duplicate - add error, if not - add record)
     */

    switch on Trigger.operationType{
        when BEFORE_INSERT{
            CTPeopleTracingTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}