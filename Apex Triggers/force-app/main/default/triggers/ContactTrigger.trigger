trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    /**
     * Contact has a checkbox "Active__c. The account object has a number field "Active contacts". Show total active child
     *  contacts on parent account. 
     */
    switch on Trigger.operationType{
        when AFTER_INSERT{
            ContactTriggerHandler.afterInsertHandler(Trigger.new);
        }
        when AFTER_UPDATE{
            ContactTriggerHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
        }
        when AFTER_DELETE{
            ContactTriggerHandler.afterDeleteHandler(Trigger.old);

        }
        when AFTER_UNDELETE{
            ContactTriggerHandler.afterUndeleteHandler(Trigger.new);

        }
        }
    }

            
            