public with sharing class ApexTrigger {
    /**
     * a database trigger is special set on operations that is run when specific actions occur within a database.
     * An APEX trigger is apex code that is run when specific actiona occur within a Salesforce object
     * Apex supports triggers before and after following events:
     * Insert, Update, Delete, Merge, Upsert, Undelete
     */

     /**
      * TRIGGER CONTEXT VARIABLES
      * Trigger.isInsert - return true if this trigger was fired due to an insert operation, similarly isUpdate,isDelete, isUndelete
      *Trigger.isBefore - return true if this trigger was fired before any record was saved / Trigger.isAfter - after was saved
      new - List of new versions of records. Available in [before and after insert, before and after update, after undelete]
      Trigger.new is same as List<SObject>

      newMap - Map of Id and new versions of records. Available in [after insert, before and after update, after undelete]
      Trigger.newMap is same as Map<Id,SObject>

      old - List of old versions of records.Available in [before and after update, before delete, after delete]
      Trigger.old is same as List<SObject>

      oldMap - Map of Id and old versions of records. Available in [before and after update, before delete, after delete]
      Trigger.oldMap is same as Map<Id,SObject>

      isExecuting - return true if current context for the Apex code is a trigger

      size - the total number of records in a trigger invocation, both old and new

      operationType - return an enum corresponding to the current operation[BEFORE_INSERT,AFTER_INSERT ETC]
 */
   
  /**
     * Records (on which trigger is running ) are READ-ONLY in AFTER triggers. Salesforce best practice is to have one trigger per object
     */

     /**
      * BEFORE vs AFTER Trigger
      Before triggers are used to update or validate record values before they've saved to Database;
      Avoid making changes to other records in before triggers

      Records that fire the After Trigger are READ-ONLY. Make changes (create/update/delete) to other records in after triggers
      */

      /**
       * ON WHICH OBJECT YOU SHOULD WRITE A TRIGGER
       * Contact has a checkbox "Active__c. The parent account of the contact myst show the number of active contacts in a number field
       * called "Active_Contacts__c" (Trigger on Contact).
       * Order has a picklist field to track the order status.when the status changes to delivered, update delivery date of OrderItems
       * (Trigger on Order).
       * We need to write a trigger on an object that is trigeering events, not on the one we need to update.
       */

       /**
        * ORDER OF EXECUTION
        */
}
